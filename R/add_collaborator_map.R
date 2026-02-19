googlescholar2collabmap <- function(
    scholar_url = "3TK9yz8AAAAJ",
    output_json = "static/data/collaborator_city_map.json",
    output_csv = "static/data/collaborator_city_map_raw.csv",
    self_names = c("Xiaotao Shen", "X Shen", "X. Shen", "Shen Xiaotao"),
    max_pubs = 200,
    sleep_sec = 0.2,
    verbose = TRUE
) {
  pkgs <- c("scholar", "rcrossref", "dplyr", "stringr", "purrr", "jsonlite", "tidyr", "tidygeocoder")
  miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
  if (length(miss) > 0) {
    stop("Please install required packages: ", paste(miss, collapse = ", "))
  }

  `%||%` <- function(x, y) if (is.null(x) || length(x) == 0 || is.na(x)) y else x
  norm_name <- function(x) {
    x <- tolower(x %||% "")
    x <- gsub("[^a-z]", "", x)
    x
  }
  parse_scholar_id <- function(url_or_id) {
    if (!grepl("^https?://", url_or_id)) return(url_or_id)
    m <- regmatches(url_or_id, regexec("([?&])user=([^&]+)", url_or_id))[[1]]
    if (length(m) >= 3) return(m[3])
    stop("Cannot parse Google Scholar user id from URL.")
  }
  if (verbose) message("Fetching publications from Google Scholar ...")
  sid <- parse_scholar_id(scholar_url)
  pubs <- scholar::get_publications(sid)
  if (is.null(pubs) || nrow(pubs) == 0) stop("No publications fetched from Google Scholar.")
  pubs <- pubs[!is.na(pubs$title) & nzchar(pubs$title), , drop = FALSE]
  pubs <- pubs[seq_len(min(nrow(pubs), max_pubs)), , drop = FALSE]

  self_norm <- unique(vapply(self_names, norm_name, character(1)))

  all_rows <- list()
  for (i in seq_len(nrow(pubs))) {
    title <- as.character(pubs$title[i])
    if (verbose && i %% 20 == 1) message(sprintf("Crossref %d / %d", i, nrow(pubs)))
    Sys.sleep(sleep_sec)

    w <- try(
      rcrossref::cr_works(
        query = title,
        limit = 1,
        select = c("title", "author")
      ),
      silent = TRUE
    )
    if (inherits(w, "try-error") || is.null(w$data) || nrow(w$data) == 0) next
    au <- w$data$author[[1]]
    if (is.null(au) || !length(au)) next

    rows_i <- purrr::map_dfr(au, function(a) {
      given <- a$given %||% ""
      family <- a$family %||% ""
      full_name <- trimws(paste(given, family))
      if (!nzchar(full_name)) return(NULL)
      aff <- NA_character_
      if (!is.null(a$affiliation) && length(a$affiliation) > 0) {
        aff <- a$affiliation[[1]]$name %||% NA_character_
      }
      dplyr::tibble(
        paper_title = title,
        collaborator = full_name,
        collaborator_norm = norm_name(full_name),
        institution = aff
      )
    })

    if (nrow(rows_i) == 0) next
    all_rows[[length(all_rows) + 1]] <- rows_i
  }

  if (length(all_rows) == 0) stop("No collaborators with affiliation found from Crossref.")
  collab_raw <- dplyr::bind_rows(all_rows)

  collab_raw <- collab_raw %>%
    dplyr::filter(!(collaborator_norm %in% self_norm)) %>%
    dplyr::filter(!is.na(institution), institution != "")

  if (nrow(collab_raw) == 0) stop("No collaborator records left after filtering self + empty affiliation.")

  aff_tbl <- collab_raw %>%
    dplyr::distinct(institution) %>%
    dplyr::rename(address = institution)

  if (verbose) message("Geocoding institutions with OSM Nominatim ...")
  geo <- tidygeocoder::geocode(
    aff_tbl,
    address = address,
    method = "osm",
    lat = lat,
    long = lng,
    full_results = TRUE,
    limit = 1
  )

  # harmonize city field across different OSM responses
  pick_first <- function(...) {
    xs <- list(...)
    for (x in xs) if (!is.null(x) && length(x) && !is.na(x) && nzchar(as.character(x))) return(as.character(x))
    NA_character_
  }
  geo$city <- vapply(
    seq_len(nrow(geo)),
    function(i) pick_first(
      geo$city[i] %||% NA_character_,
      geo$town[i] %||% NA_character_,
      geo$village[i] %||% NA_character_,
      geo$municipality[i] %||% NA_character_,
      geo$county[i] %||% NA_character_
    ),
    character(1)
  )
  geo$country <- if ("country" %in% names(geo)) as.character(geo$country) else NA_character_

  collab_geo <- collab_raw %>%
    dplyr::left_join(
      geo %>% dplyr::select(address, city, country, lat, lng),
      by = c("institution" = "address")
    ) %>%
    dplyr::filter(!is.na(lat), !is.na(lng), !is.na(city), city != "")

  if (nrow(collab_geo) == 0) stop("No geocoded collaborator records. Try reducing max_pubs or checking network.")

  city_summary <- collab_geo %>%
    dplyr::group_by(city, country) %>%
    dplyr::summarise(
      lat = mean(lat, na.rm = TRUE),
      lng = mean(lng, na.rm = TRUE),
      count = dplyr::n(), # person-times
      .groups = "drop"
    ) %>%
    dplyr::arrange(dplyr::desc(count), city)

  collab_list <- collab_geo %>%
    dplyr::group_by(city, country) %>%
    dplyr::summarise(
      collaborators = list(
        dplyr::distinct(dplyr::tibble(name = collaborator, institution = institution))
      ),
      .groups = "drop"
    )

  out_tbl <- city_summary %>%
    dplyr::left_join(collab_list, by = c("city", "country"))

  out <- purrr::pmap(
    out_tbl,
    function(city, country, lat, lng, count, collaborators) {
      list(
        city = city,
        country = country %||% "",
        lat = as.numeric(lat),
        lng = as.numeric(lng),
        count = as.integer(count),
        collaborators = unname(purrr::map(
          seq_len(nrow(collaborators)),
          function(i) list(
            name = collaborators$name[i],
            institution = collaborators$institution[i]
          )
        ))
      )
    }
  )

  dir.create(dirname(output_json), recursive = TRUE, showWarnings = FALSE)
  jsonlite::write_json(out, output_json, auto_unbox = TRUE, pretty = TRUE)
  utils::write.csv(collab_geo, output_csv, row.names = FALSE)

  if (verbose) {
    message("Saved map JSON: ", output_json)
    message("Saved raw table: ", output_csv)
    message("Cities: ", nrow(city_summary), "; collaborator rows: ", nrow(collab_geo))
  }
  invisible(out_tbl)
}
