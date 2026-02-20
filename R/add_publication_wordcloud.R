publication2wordcloud <- function(
    publication_dir = "content/publication",
    output_json = "data/publication_keywords.json",
    top_n = 10,
    min_word_len = 3,
    verbose = TRUE
) {
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Please install package 'jsonlite'")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Please install package 'dplyr'")
  }
  `%>%` <- dplyr::`%>%`

  files <- list.files(publication_dir, pattern = "^index\\.md$", recursive = TRUE, full.names = TRUE)
  if (length(files) == 0) stop("No publication files found in: ", publication_dir)

  read_title <- function(path) {
    lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
    i <- grep("^title\\s*:", lines)[1]
    if (is.na(i)) return(NA_character_)
    x <- sub("^title\\s*:\\s*", "", lines[i])
    x <- gsub("^['\"]|['\"]$", "", trimws(x))
    if (!nzchar(x)) return(NA_character_)
    x
  }

  titles <- vapply(files, read_title, character(1))
  titles <- titles[!is.na(titles)]
  if (length(titles) == 0) stop("No publication titles parsed.")

  txt <- paste(titles, collapse = " ")
  txt <- tolower(txt)
  txt <- gsub("multi-omics", "multiomics", txt, fixed = TRUE)
  txt <- gsub("lc-ms", "lcms", txt, fixed = TRUE)
  txt <- gsub("ion mobility-mass spectrometry", "ionmobilitymassspectrometry", txt, fixed = TRUE)
  txt <- gsub("[^a-z0-9\\s]", " ", txt)
  txt <- gsub("\\s+", " ", txt)
  words <- unlist(strsplit(trimws(txt), "\\s+"))

  stop_words <- unique(c(
    "a","an","and","are","as","at","be","by","for","from","in","into","is","it","of","on","or","that","the","to","towards","using","via","with","without",
    "based","analysis","study","studies","reveals","reveal","through","during","large","scale","toward",
    "model","models","approach","application","applications","system","systems","data","method","methods","project",
    "between","body","bodies","countries","country","cross","early","four","income","low","mapping","specific","support","supports","supported","type","types"
  ))

  df <- data.frame(word = words, stringsAsFactors = FALSE) %>%
    dplyr::filter(
      nchar(word) >= min_word_len,
      !grepl("^[0-9]+$", word),
      !(word %in% stop_words)
    ) %>%
    dplyr::count(word, sort = TRUE) %>%
    dplyr::slice_head(n = top_n)

  out <- list(
    generated_at = as.character(Sys.time()),
    keywords = lapply(seq_len(nrow(df)), function(i) {
      list(word = as.character(df$word[i]), count = as.integer(df$n[i]))
    })
  )

  dir.create(dirname(output_json), recursive = TRUE, showWarnings = FALSE)
  jsonlite::write_json(out, output_json, pretty = TRUE, auto_unbox = TRUE)
  if (verbose) message("Saved keyword cloud JSON: ", output_json)
  invisible(out)
}
