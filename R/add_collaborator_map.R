googlescholar2collabmap <- function(
    scholar_url = "3TK9yz8AAAAJ",
    output_json = "static/data/collaborator_city_map.json",
    output_csv = "static/data/collaborator_city_map_raw.csv",
    self_names = c("Xiaotao Shen", "X Shen", "X. Shen", "Shen Xiaotao"),
    authors_dir = "content/authors",
    max_pubs = 200,
    sleep_sec = 0.2,
    use_openalex_fallback = TRUE,
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
  first_nonempty_chr <- function(x) {
    x <- as.character(x)
    x <- x[!is.na(x) & nzchar(trimws(x))]
    if (length(x) == 0) NA_character_ else trimws(x[[1]])
  }
  extract_affiliation <- function(a) {
    if (is.null(a)) return(NA_character_)

    # rcrossref versions may return either a nested `affiliation` object or
    # flattened columns such as `affiliation.name`.
    for (key in c("affiliation.name", "affiliation_name")) {
      if (!is.null(names(a)) && key %in% names(a)) {
        aff <- first_nonempty_chr(a[[key]])
        if (!is.na(aff)) return(aff)
      }
    }

    if (is.null(names(a)) || !("affiliation" %in% names(a))) return(NA_character_)
    af <- a[["affiliation"]]
    if (is.character(af)) return(first_nonempty_chr(af))
    if (is.data.frame(af)) {
      for (key in c("name", "affiliation.name")) {
        if (key %in% names(af)) {
          aff <- first_nonempty_chr(af[[key]])
          if (!is.na(aff)) return(aff)
        }
      }
    }
    if (is.list(af)) {
      for (item in af) {
        if (is.character(item)) {
          aff <- first_nonempty_chr(item)
        } else if (is.list(item) && !is.null(item$name)) {
          aff <- first_nonempty_chr(item$name)
        } else {
          aff <- NA_character_
        }
        if (!is.na(aff)) return(aff)
      }
    }
    NA_character_
  }
  author_records <- function(x) {
    if (is.null(x) || length(x) == 0) return(list())
    if (is.data.frame(x)) {
      return(lapply(seq_len(nrow(x)), function(i) as.list(x[i, , drop = FALSE])))
    }
    if (is.list(x) && !is.null(names(x)) && any(c("given", "family") %in% names(x))) {
      return(list(x))
    }
    if (is.list(x)) return(x)
    list()
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
  fallback_to_openalex <- function(reason) {
    if (!isTRUE(use_openalex_fallback)) stop(reason)
    if (verbose) {
      message(reason)
      message("Falling back to OpenAlex for author affiliations and coordinates ...")
    }
    googlescholar2collabmap_openalex(
      scholar_url = scholar_url,
      output_json = output_json,
      output_csv = output_csv,
      self_names = self_names,
      max_pubs = max_pubs,
      sleep_sec = sleep_sec,
      verbose = verbose
    )
  }

  all_rows <- list()
  for (i in seq_len(nrow(pubs))) {
    title <- as.character(pubs$title[i])
    if (verbose && i %% 20 == 1) message(sprintf("Crossref %d / %d", i, nrow(pubs)))
    Sys.sleep(sleep_sec)

    w <- try(rcrossref::cr_works(query = title, limit = 1), silent = TRUE)
    if (inherits(w, "try-error") || is.null(w$data) || nrow(w$data) == 0) next
    au <- w$data$author[[1]]
    author_list <- author_records(au)
    if (length(author_list) == 0) next

    rows_i <- purrr::map_dfr(author_list, function(a) {
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

  if (length(all_rows) == 0) {
    return(invisible(fallback_to_openalex(
      paste0(
        "Crossref returned no usable author records. ",
        "This can be caused by rate limiting or missing author metadata."
      )
    )))
  }
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

  if (nrow(collab_raw) == 0) {
    return(invisible(fallback_to_openalex(
      "Crossref author records contained no usable collaborator affiliations."
    )))
  }

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

  # Harmonize coordinates and location fields across tidygeocoder/OSM
  # response variants. Depending on package/API versions, longitude may be
  # returned as lng, long, lon, or longitude, and city may be town/village/etc.
  coalesce_num_col <- function(df, keys) {
    vals <- rep(NA_real_, nrow(df))
    for (key in keys) {
      if (!key %in% names(df)) next
      x <- suppressWarnings(as.numeric(df[[key]]))
      use <- is.na(vals) & !is.na(x)
      vals[use] <- x[use]
    }
    vals
  }
  coalesce_chr_col <- function(df, keys) {
    vals <- rep(NA_character_, nrow(df))
    for (key in keys) {
      if (!key %in% names(df)) next
      x <- trimws(as.character(df[[key]]))
      x[is.na(x)] <- ""
      use <- is.na(vals) & nzchar(x)
      vals[use] <- x[use]
    }
    vals
  }
  geo$lat <- coalesce_num_col(geo, c("lat", "latitude"))
  geo$lng <- coalesce_num_col(geo, c("lng", "long", "lon", "longitude"))
  geo$city <- coalesce_chr_col(
    geo,
    c("city", "town", "village", "municipality", "county", "state", "name")
  )
  display_name <- coalesce_chr_col(geo, c("display_name"))
  missing_city <- is.na(geo$city) | geo$city == ""
  geo$city[missing_city & !is.na(display_name) & display_name != ""] <-
    sub(",.*$", "", display_name[missing_city & !is.na(display_name) & display_name != ""])
  geo$country <- coalesce_chr_col(geo, c("country", "country_code"))

  collab_geo <- collab_raw %>%
    dplyr::left_join(
      geo %>% dplyr::select(address, city, country, lat, lng),
      by = c("institution" = "address")
    ) %>%
    dplyr::filter(!is.na(lat), !is.na(lng), !is.na(city), city != "")

  if (nrow(collab_geo) == 0) {
    return(invisible(fallback_to_openalex(
      paste0(
        "Nominatim returned no usable geocoded collaborator records. ",
        "This can be caused by OSM rate limiting, network issues, or changed tidygeocoder response fields."
      )
    )))
  }

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
