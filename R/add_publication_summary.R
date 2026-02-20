googlescholar2pubsummary <- function(
    scholar_url = "3TK9yz8AAAAJ",
    output_json = "static/data/publication_summary.json",
    verbose = TRUE
) {
  if (!requireNamespace("scholar", quietly = TRUE)) {
    stop("Please install package 'scholar': install.packages('scholar')")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Please install package 'jsonlite': install.packages('jsonlite')")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Please install package 'dplyr': install.packages('dplyr')")
  }
  `%>%` <- dplyr::`%>%`

  parse_scholar_id <- function(url_or_id) {
    if (!grepl("^https?://", url_or_id)) return(url_or_id)
    m <- regmatches(url_or_id, regexec("([?&])user=([^&]+)", url_or_id))[[1]]
    if (length(m) >= 3) return(m[3])
    stop("Cannot parse Google Scholar user id from URL.")
  }

  sid <- parse_scholar_id(scholar_url)
  pubs <- scholar::get_publications(sid)
  if (is.null(pubs) || nrow(pubs) == 0) stop("No publications fetched from Google Scholar.")

  pubs <- pubs %>%
    dplyr::filter(!is.na(year), year > 1900) %>%
    dplyr::mutate(cites = ifelse(is.na(cites), 0, cites))

  pub_year <- pubs %>%
    dplyr::group_by(year) %>%
    dplyr::summarise(count = dplyr::n(), .groups = "drop") %>%
    dplyr::arrange(year)

  cite_hist <- scholar::get_citation_history(sid)
  cite_year <- cite_hist %>%
    dplyr::filter(!is.na(year), year > 1900) %>%
    dplyr::mutate(cites = ifelse(is.na(cites), 0, cites)) %>%
    dplyr::group_by(year) %>%
    dplyr::summarise(count = sum(cites, na.rm = TRUE), .groups = "drop") %>%
    dplyr::arrange(year)

  out <- list(
    publication_per_year = lapply(seq_len(nrow(pub_year)), function(i) {
      list(year = as.integer(pub_year$year[i]), count = as.integer(pub_year$count[i]))
    }),
    citation_per_year = lapply(seq_len(nrow(cite_year)), function(i) {
      list(year = as.integer(cite_year$year[i]), count = as.integer(cite_year$count[i]))
    })
  )

  dir.create(dirname(output_json), recursive = TRUE, showWarnings = FALSE)
  jsonlite::write_json(out, output_json, auto_unbox = TRUE, pretty = TRUE)

  if (verbose) message("Saved publication summary JSON: ", output_json)
  invisible(out)
}
