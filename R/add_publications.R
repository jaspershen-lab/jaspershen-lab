googlescholar2shenlab <- function(
    scholar_url = "3TK9yz8AAAAJ",
    publication_dir = "content/publication",
    default_pub_type = "2",
    default_author = "admin",
    dry_run = FALSE,
    verbose = TRUE
) {
  if (!requireNamespace("scholar", quietly = TRUE)) {
    stop("Please install package 'scholar': install.packages('scholar')")
  }
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Please install package 'httr'")
  }
  if (!requireNamespace("xml2", quietly = TRUE)) {
    stop("Please install package 'xml2'")
  }
  if (!requireNamespace("rvest", quietly = TRUE)) {
    stop("Please install package 'rvest'")
  }
  
  if (!requireNamespace("rcrossref", quietly = TRUE)) {
    stop("Please install package 'rcrossref'")
  }
  if (!requireNamespace("stringi", quietly = TRUE)) {
    stop("Please install package 'stringi'")
  }
  
  
  # ---- main ----
  local_author_map <- build_local_author_map()
  scholar_id <- parse_scholar_id(scholar_url)
  profile_url <- if (grepl("^https?://", scholar_url)) scholar_url else
    sprintf("https://scholar.google.com/citations?user=%s&hl=en", scholar_id)
  
  pubs <- scholar::get_publications(scholar_id)
  if (is.null(pubs) || nrow(pubs) == 0) {
    stop("No publications fetched from Google Scholar.")
  }
  
  if (!dir.exists(publication_dir)) {
    stop("publication_dir does not exist: ", publication_dir)
  }
  
  existing_norm <- read_existing_titles(publication_dir)
  pubs$title_norm <- vapply(pubs$title, normalize_title, character(1))
  
  pubs <-
    pubs %>% 
    dplyr::filter(!is.na(title_norm))
  
  # pubs <- pubs[!mapply(
  #   function(j, t) is_excluded(j, t),
  #   pubs$journal, pubs$title
  # ), , drop = FALSE]
  
  pubs <- pubs[mapply(
    function(j, t) is_preprint(j, t) || is_journal_like(j),
    pubs$journal, pubs$title
  ), , drop = FALSE]
  
  pubs <-
    pubs %>% 
    dplyr::filter(!stringr::str_detect(title, "Author Correction"))
  
  to_add <- pubs[!(pubs$title_norm %in% existing_norm), , drop = FALSE]
  if (nrow(to_add) == 0) {
    if (verbose) message("No new publications to add.")
    return(invisible(data.frame(
      added = FALSE, title = character(0), path = character(0), stringsAsFactors = FALSE
    )))
  }
  
  results <- vector("list", nrow(to_add))
  for (i in seq_len(nrow(to_add))) {
    row <- to_add[i, , drop = FALSE]
    title <- as.character(row$title[[1]])
    journal <- if ("journal" %in% names(row)) as.character(row$journal[[1]]) else ""
    year <- if ("year" %in% names(row)) suppressWarnings(as.integer(row$year[[1]])) else NA_integer_
    pubid <- if ("pubid" %in% names(row)) as.character(row$pubid[[1]]) else ""
    author_short <- if ("author" %in% names(row)) as.character(row$author[[1]]) else ""

    # Priority: Scholar article page full names > Crossref > local-map expansion > raw author string
    authors <- fetch_authors_from_scholar(scholar_id, pubid)
    if (is.null(authors)) authors <- fetch_authors_crossref(title)
    if (is.null(authors) && nzchar(author_short)) authors <- expand_initial_authors(author_short, local_author_map)
    if (is.null(authors) || length(authors) == 0) {
      authors <- if (nzchar(author_short)) parse_authors(author_short, default_author = default_author) else default_author
    }
    authors <- normalize_authors_for_site(authors)
    
    
    slug <- slugify(title)
    dir_new <- unique_dir(publication_dir, slug)
    index_path <- file.path(dir_new, "index.md")
    
    # if pubid exists, try to build citation link
    scholar_link <- profile_url
    if ("pubid" %in% names(row) && !is.na(row$pubid[[1]]) && nzchar(as.character(row$pubid[[1]]))) {
      scholar_link <- sprintf(
        "https://scholar.google.com/citations?view_op=view_citation&hl=en&user=%s&citation_for_view=%s:%s",
        scholar_id, scholar_id, as.character(row$pubid[[1]])
      )
    }
    
    if (!dry_run) {
      dir.create(dir_new, recursive = TRUE, showWarnings = FALSE)
      write_pub_index(index_path, title, authors, journal, year, scholar_link)
    }
    
    results[[i]] <- data.frame(
      added = !dry_run,
      title = title,
      path = index_path,
      stringsAsFactors = FALSE
    )
    if (verbose) message(sprintf("[ADD] %s -> %s", title, index_path))
  }
  
  do.call(rbind, results)
}



# ---- helpers ----
trim_ws <- function(x) gsub("^\\s+|\\s+$", "", x)
unquote_str <- function(x) gsub("^['\"]|['\"]$", "", x)

normalize_title <- function(x) {
  x <- tolower(trim_ws(x))
  x <- iconv(x, to = "ASCII//TRANSLIT")
  x <- gsub("[^a-z0-9]+", " ", x)
  x <- gsub("\\s+", " ", x)
  trim_ws(x)
}

slugify <- function(x) {
  x <- iconv(x, to = "ASCII//TRANSLIT")
  x <- tolower(x)
  x <- gsub("[^a-z0-9]+", "-", x)
  x <- gsub("(^-+|-+$)", "", x)
  if (nchar(x) == 0) x <- "publication"
  x
}

yaml_safe <- function(x) {
  x <- ifelse(is.na(x) | x == "", "", x)
  x <- gsub("\"", "\\\\\"", x, fixed = TRUE)
  x
}

parse_scholar_id <- function(url_or_id) {
  if (!grepl("^https?://", url_or_id)) return(url_or_id)
  m <- regmatches(url_or_id, regexec("([?&])user=([^&]+)", url_or_id))[[1]]
  if (length(m) >= 3) return(m[3])
  stop("Cannot parse Google Scholar user id from URL.")
}

parse_authors <- function(author_str, default_author = "admin") {
  if (is.null(author_str) || is.na(author_str) || trim_ws(author_str) == "") {
    return(default_author)
  }
  a <- gsub("\\band\\b", ",", author_str, ignore.case = TRUE)
  a <- unlist(strsplit(a, ","))
  a <- trim_ws(a)
  a <- a[nzchar(a)]
  if (length(a) == 0) default_author else a
}

# 从 Google Scholar 文章详情页抓作者全称（非缩写）
fetch_authors_from_scholar <- function(user_id, pubid, hl = "en", sleep_sec = 0.5) {
  if (is.null(pubid) || is.na(pubid) || !nzchar(pubid)) return(NULL)

  url <- sprintf(
    "https://scholar.google.com/citations?view_op=view_citation&hl=%s&user=%s&citation_for_view=%s:%s",
    hl, user_id, user_id, pubid
  )

  # 减少被 Scholar 频控的概率
  Sys.sleep(sleep_sec)

  resp <- try(
    httr::GET(url, httr::user_agent("Mozilla/5.0 (compatible; R script for scholar import)")),
    silent = TRUE
  )
  if (inherits(resp, "try-error")) return(NULL)
  if (httr::status_code(resp) >= 400) return(NULL)

  doc <- try(xml2::read_html(httr::content(resp, as = "text", encoding = "UTF-8")), silent = TRUE)
  if (inherits(doc, "try-error")) return(NULL)

  fields <- rvest::html_text(rvest::html_elements(doc, ".gsc_oci_field"), trim = TRUE)
  values <- rvest::html_text(rvest::html_elements(doc, ".gsc_oci_value"), trim = TRUE)
  if (length(fields) == 0 || length(values) == 0) return(NULL)

  idx <- which(tolower(fields) %in% c("authors", "author", "作者"))
  if (!length(idx)) return(NULL)

  author_str <- values[idx[1]]
  if (!nzchar(author_str)) return(NULL)

  a <- trim_ws(unlist(strsplit(author_str, ",")))
  a <- a[nzchar(a)]
  if (!length(a)) return(NULL)
  a
}

read_existing_titles <- function(dir_path) {
  files <- list.files(dir_path, pattern = "^index\\.md$", recursive = TRUE, full.names = TRUE)
  if (length(files) == 0) return(character(0))
  titles <- vapply(files, function(f) {
    lines <- readLines(f, warn = FALSE, encoding = "UTF-8")
    i <- grep("^title\\s*:", lines)[1]
    if (is.na(i)) return(NA_character_)
    t <- sub("^title\\s*:\\s*", "", lines[i])
    unquote_str(trim_ws(t))
  }, character(1))
  titles <- titles[!is.na(titles) & nzchar(titles)]
  unique(vapply(titles, normalize_title, character(1)))
}

unique_dir <- function(base_dir, slug) {
  candidate <- file.path(base_dir, slug)
  if (!dir.exists(candidate)) return(candidate)
  i <- 2L
  repeat {
    candidate <- file.path(base_dir, paste0(slug, "-", i))
    if (!dir.exists(candidate)) return(candidate)
    i <- i + 1L
  }
}

write_pub_index <- function(path, title, authors, journal, year, scholar_link) {
  pub_date <- if (!is.na(year) && nzchar(as.character(year))) {
    sprintf("%s-01-01", as.integer(year))
  } else {
    format(Sys.Date(), "%Y-%m-%d")
  }
  
  lines <- c(
    "---",
    sprintf("title: \"%s\"", yaml_safe(title)),
    "",
    "authors:"
  )
  for (a in authors) lines <- c(lines, sprintf("- %s", a))
  lines <- c(
    lines,
    "",
    "featured: false",
    sprintf("publication: \"%s\"", yaml_safe(journal)),
    "publication_types:",
    sprintf("- \"%s\"", yaml_safe(default_pub_type)),
    sprintf("publishDate: %s", pub_date),
    sprintf("summary: \"%s\"", yaml_safe(title)),
    "links:",
    "- icon: link",
    "  icon_pack: fas",
    "  name: Link",
    sprintf("  url: %s", scholar_link),
    "---",
    ""
  )
  writeLines(lines, con = path, useBytes = TRUE)
}

# ---- filter: keep only journal articles + preprints ----
is_preprint <- function(journal, title) {
  x <- paste(journal, title)
  grepl(
    "(bioRxiv|medRxiv|arXiv|Research\\s*Square|SSRN|preprint)",
    x, ignore.case = TRUE
  )
}

is_excluded <- function(journal, title) {
  x <- paste(journal, title)
  
  # 专利
  if (grepl("patent|专利", x, ignore.case = TRUE)) return(TRUE)
  
  # Author Correction / Corrigendum / Erratum
  if (grepl("author\\s*correction|corrigendum|erratum|correction", x, ignore.case = TRUE)) return(TRUE)
  
  # Supplement
  if (grepl("supplement[_\\- ]?\\d+|supplementary|^supplement", x, ignore.case = TRUE)) return(TRUE)
  
  # 中文文章（标题或期刊名含中文）
  if (grepl("[\u4e00-\u9fff]", x)) return(TRUE)
  
  FALSE
}

is_journal_like <- function(journal) {
  # 有期刊名，且不是空
  !is.na(journal) && nzchar(trim_ws(journal))
}


# 读本地作者全名映射（content/authors/*/_index.md）
build_local_author_map <- function(authors_dir = "/Users/xiaotaoshen/github/jaspershen-lab/content/authors") {
  files <- list.files(authors_dir, pattern = "_index\\.md$", recursive = TRUE, full.names = TRUE)
  out <- list()
  for (f in files) {
    x <- readLines(f, warn = FALSE, encoding = "UTF-8")
    i <- grep("^title\\s*:", x)[1]
    if (is.na(i)) next
    nm <- trimws(sub("^title\\s*:\\s*", "", x[i]))
    nm <- gsub("^['\"]|['\"]$", "", nm)
    if (!nzchar(nm)) next
    parts <- strsplit(nm, "\\s+")[[1]]
    if (length(parts) < 2) next
    key <- paste0(tolower(substr(parts[1], 1, 1)), "_", tolower(parts[length(parts)]))
    out[[key]] <- nm
  }
  out
}

# Crossref 按标题查作者全名
fetch_authors_crossref <- function(title) {
  res <- try(
    rcrossref::cr_works(
      query.title = title,
      limit = 1,
      select = c("title", "author")
    ),
    silent = TRUE
  )
  if (inherits(res, "try-error") || is.null(res$data) || nrow(res$data) == 0) return(NULL)
  
  a <- res$data$author[[1]]
  if (is.null(a) || length(a) == 0) return(NULL)
  
  # case 1: list of author objects
  if (is.list(a) && !is.data.frame(a)) {
    full <- vapply(a, function(z) {
      if (!is.list(z)) return(NA_character_)
      g <- trimws(if (!is.null(z[["given"]])) as.character(z[["given"]]) else "")
      f <- trimws(if (!is.null(z[["family"]])) as.character(z[["family"]]) else "")
      nm <- trimws(paste(g, f))
      if (nzchar(nm)) nm else NA_character_
    }, character(1))
    full <- full[!is.na(full)]
    return(if (length(full)) full else NULL)
  }
  
  # case 2: data.frame with given/family columns
  if (is.data.frame(a)) {
    if (all(c("given", "family") %in% names(a))) {
      full <- trimws(paste(a$given, a$family))
      full <- full[nzchar(full)]
      return(if (length(full)) full else NULL)
    }
  }
  
  # case 3: atomic/character (fallback: cannot parse reliably)
  NULL
}


# 把 "X Shen" 用本地映射扩成 "Xiaotao Shen"
expand_initial_authors <- function(author_str, local_map) {
  a <- gsub("\\band\\b", ",", author_str, ignore.case = TRUE)
  a <- trimws(unlist(strsplit(a, ",")))
  a <- a[nzchar(a)]
  
  vapply(a, function(one) {
    # 兼容 "X Shen" / "X. Shen"
    m <- regexec("^([A-Za-z])\\.?\\s+([A-Za-z'\\-]+)$", one)
    g <- regmatches(one, m)[[1]]
    if (length(g) == 3) {
      key <- paste0(tolower(g[2]), "_", tolower(g[3]))
      if (!is.null(local_map[[key]])) return(local_map[[key]])
    }
    one
  }, character(1))
}

# 作者名站点格式：
# 1) Xiaotao Shen -> admin
# 2) 其他作者：last name 全大写
normalize_authors_for_site <- function(authors) {
  if (is.null(authors) || length(authors) == 0) return("admin")

  vapply(authors, function(a) {
    a <- trim_ws(as.character(a))
    if (!nzchar(a)) return("admin")

    # Keep existing Hugo author id
    if (tolower(a) == "admin") return("admin")

    # Map PI name to Hugo author id
    if (tolower(a) == "xiaotao shen") return("admin")

    parts <- strsplit(a, "\\s+")[[1]]
    if (length(parts) == 1) {
      toupper(parts)
    } else {
      parts[length(parts)] <- toupper(parts[length(parts)])
      paste(parts, collapse = " ")
    }
  }, character(1))
}
