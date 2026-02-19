googlescholar2collabmap <- function(
    scholar_url = "3TK9yz8AAAAJ",
    output_json = "static/data/collaborator_city_map.json",
    output_csv = "static/data/collaborator_city_map_raw.csv",
    self_names = c("Xiaotao Shen", "X Shen", "X. Shen", "Shen Xiaotao"),
    authors_dir = "content/authors",
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
  `%>%` <- dplyr::`%>%`
  field_chr <- function(x, key) {
    if (is.null(x)) return(NA_character_)
    if (is.list(x)) {
      v <- x[[key]]
      if (is.null(v) || length(v) == 0) return(NA_character_)
      return(as.character(v[[1]]))
    }
    if (!is.null(names(x)) && key %in% names(x)) {
      v <- x[[key]]
      if (is.null(v) || length(v) == 0) return(NA_character_)
      return(as.character(v[[1]]))
    }
    NA_character_
  }
  extract_affiliation <- function(a) {
    aff <- NA_character_
    if (is.list(a) && !is.null(a$affiliation) && length(a$affiliation) > 0) {
      first_aff <- a$affiliation[[1]]
      if (is.list(first_aff) && !is.null(first_aff$name)) aff <- as.character(first_aff$name[[1]])
      if (is.atomic(first_aff) && !is.null(names(first_aff)) && "name" %in% names(first_aff)) aff <- as.character(first_aff[["name"]])
    } else if (!is.null(names(a)) && "affiliation" %in% names(a)) {
      af <- a[["affiliation"]]
      if (is.character(af) && length(af) > 0) aff <- af[[1]]
    }
    aff
  }
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
  local_aff_map <- build_local_affiliation_map(authors_dir)
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

    w <- try(rcrossref::cr_works(query = title, limit = 1), silent = TRUE)
    if (inherits(w, "try-error") || is.null(w$data) || nrow(w$data) == 0) next
    au <- w$data$author[[1]]
    if (is.null(au) || !length(au)) next

    rows_i <- purrr::map_dfr(au, function(a) {
      given <- field_chr(a, "given") %||% ""
      family <- field_chr(a, "family") %||% ""
      full_name <- trimws(paste(given, family))
      if (!nzchar(full_name)) return(NULL)
      aff <- extract_affiliation(a)
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
    dplyr::mutate(
      institution = dplyr::if_else(
        is.na(institution) | institution == "",
        vapply(collaborator_norm, function(k) local_aff_map[[k]] %||% NA_character_, character(1)),
        institution
      )
    ) %>%
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

build_local_affiliation_map <- function(authors_dir = "content/authors") {
  `%||%` <- function(x, y) if (is.null(x) || length(x) == 0 || is.na(x)) y else x
  norm_name <- function(x) tolower(gsub("[^a-z]", "", x %||% ""))
  files <- list.files(authors_dir, pattern = "_index\\.md$", recursive = TRUE, full.names = TRUE)
  out <- list()
  for (f in files) {
    lines <- readLines(f, warn = FALSE, encoding = "UTF-8")
    t_idx <- grep("^title\\s*:", lines)[1]
    if (is.na(t_idx)) next
    title <- sub("^title\\s*:\\s*", "", lines[t_idx])
    title <- gsub("^['\"]|['\"]$", "", trimws(title))
    if (!nzchar(title)) next
    org_idx <- grep("^-\\s*name\\s*:", lines)[1]
    if (is.na(org_idx)) next
    inst <- sub("^-\\s*name\\s*:\\s*", "", lines[org_idx])
    inst <- gsub("^['\"]|['\"]$", "", trimws(inst))
    if (!nzchar(inst)) next
    out[[norm_name(title)]] <- inst
  }
  out
}

# More robust generator using OpenAlex (recommended)
googlescholar2collabmap_openalex <- function(
    scholar_url = "3TK9yz8AAAAJ",
    output_json = "static/data/collaborator_city_map.json",
    output_csv = "static/data/collaborator_city_map_raw.csv",
    self_names = c("Xiaotao Shen", "X Shen", "X. Shen", "Shen Xiaotao"),
    max_pubs = 200,
    sleep_sec = 0.15,
    verbose = TRUE
) {
  pkgs <- c("scholar", "httr", "jsonlite", "dplyr", "purrr", "stringr")
  miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
  if (length(miss) > 0) stop("Please install required packages: ", paste(miss, collapse = ", "))

  parse_scholar_id <- function(url_or_id) {
    if (!grepl("^https?://", url_or_id)) return(url_or_id)
    m <- regmatches(url_or_id, regexec("([?&])user=([^&]+)", url_or_id))[[1]]
    if (length(m) >= 3) return(m[3])
    stop("Cannot parse Google Scholar user id from URL.")
  }
  norm_name <- function(x) tolower(gsub("[^a-z]", "", x %||% ""))
  `%||%` <- function(x, y) if (is.null(x) || length(x) == 0 || is.na(x)) y else x
  `%>%` <- dplyr::`%>%`

  sid <- parse_scholar_id(scholar_url)
  pubs <- scholar::get_publications(sid)
  pubs <- pubs[!is.na(pubs$title) & nzchar(pubs$title), , drop = FALSE]
  pubs <- pubs[seq_len(min(nrow(pubs), max_pubs)), , drop = FALSE]

  self_norm <- unique(vapply(self_names, norm_name, character(1)))
  rows <- list()
  inst_cache <- new.env(parent = emptyenv())

  fetch_inst_geo <- function(inst_id) {
    if (is.null(inst_id) || is.na(inst_id) || !nzchar(inst_id)) return(NULL)
    key <- gsub("^https?://openalex\\.org/", "", inst_id)
    if (exists(key, envir = inst_cache, inherits = FALSE)) return(get(key, envir = inst_cache))
    url <- sprintf("https://api.openalex.org/institutions/%s", key)
    resp <- try(httr::GET(url, httr::user_agent("R collaborator map builder")), silent = TRUE)
    if (inherits(resp, "try-error") || httr::status_code(resp) >= 400) {
      assign(key, NULL, envir = inst_cache)
      return(NULL)
    }
    js <- try(jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"), simplifyVector = FALSE), silent = TRUE)
    if (inherits(js, "try-error")) {
      assign(key, NULL, envir = inst_cache)
      return(NULL)
    }
    g <- js$geo
    out <- list(
      city = g$city %||% NA_character_,
      country = g$country %||% (g$country_code %||% NA_character_),
      lat = as.numeric(g$latitude %||% NA_real_),
      lng = as.numeric(g$longitude %||% NA_real_),
      institution = js$display_name %||% NA_character_
    )
    assign(key, out, envir = inst_cache)
    out
  }

  for (i in seq_len(nrow(pubs))) {
    title <- as.character(pubs$title[i])
    if (verbose && i %% 20 == 1) message(sprintf("OpenAlex %d / %d", i, nrow(pubs)))
    Sys.sleep(sleep_sec)
    q <- utils::URLencode(title, reserved = TRUE)
    url <- sprintf("https://api.openalex.org/works?search=%s&per-page=1", q)
    resp <- try(httr::GET(url, httr::user_agent("R collaborator map builder")), silent = TRUE)
    if (inherits(resp, "try-error") || httr::status_code(resp) >= 400) next
    txt <- httr::content(resp, as = "text", encoding = "UTF-8")
    js <- try(jsonlite::fromJSON(txt, simplifyVector = FALSE), silent = TRUE)
    if (inherits(js, "try-error") || is.null(js$results) || length(js$results) == 0) next
    w <- js$results[[1]]
    if (is.null(w$authorships) || length(w$authorships) == 0) next

    rows_i <- purrr::map_dfr(w$authorships, function(a) {
      nm <- a$author$display_name %||% NA_character_
      if (is.na(nm) || !nzchar(nm)) return(NULL)
      if (norm_name(nm) %in% self_norm) return(NULL)
      if (is.null(a$institutions) || length(a$institutions) == 0) return(NULL)
      geo <- NULL
      for (inst in a$institutions) {
        geo <- fetch_inst_geo(inst$id %||% NA_character_)
        if (!is.null(geo) && !is.na(geo$city) && !is.na(geo$lat) && !is.na(geo$lng)) break
      }
      if (is.null(geo) || is.na(geo$city) || is.na(geo$lat) || is.na(geo$lng)) return(NULL)
      dplyr::tibble(
        paper_title = title,
        collaborator = nm,
        institution = geo$institution,
        city = geo$city,
        country = geo$country,
        lat = geo$lat,
        lng = geo$lng
      )
    })
    if (nrow(rows_i) > 0) rows[[length(rows) + 1]] <- rows_i
  }

  if (length(rows) == 0) stop("No collaborator city records found from OpenAlex.")
  collab_geo <- dplyr::bind_rows(rows)
  utils::write.csv(collab_geo, output_csv, row.names = FALSE)

  city_summary <- collab_geo %>%
    dplyr::group_by(city, country) %>%
    dplyr::summarise(
      lat = mean(lat, na.rm = TRUE),
      lng = mean(lng, na.rm = TRUE),
      count = dplyr::n(),
      .groups = "drop"
    ) %>%
    dplyr::arrange(dplyr::desc(count), city)

  collab_list <- collab_geo %>%
    dplyr::group_by(city, country) %>%
    dplyr::summarise(
      collaborators = list(dplyr::distinct(dplyr::tibble(name = collaborator, institution = institution))),
      .groups = "drop"
    )

  out_tbl <- city_summary %>% dplyr::left_join(collab_list, by = c("city", "country"))
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
          function(i) list(name = collaborators$name[i], institution = collaborators$institution[i])
        ))
      )
    }
  )
  dir.create(dirname(output_json), recursive = TRUE, showWarnings = FALSE)
  jsonlite::write_json(out, output_json, auto_unbox = TRUE, pretty = TRUE)
  if (verbose) message("Saved map JSON: ", output_json, " | cities: ", nrow(city_summary))
  invisible(out_tbl)
}
