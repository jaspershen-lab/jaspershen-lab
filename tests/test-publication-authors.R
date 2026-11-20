# Offline regression checks for truncated/wrong author imports.
source("R/add_publications.R")
stopifnot(!authors_are_complete(c("Yuting Wang", "...")),
          !authors_are_complete(c("Yuting Wang", "…")),
          !authors_are_complete(c("Yuting Wang", "et al.")),
          !authors_are_complete(c("DJ Panyard", "X Shen")),
          !authors_are_complete(NULL), !authors_are_complete(NA_character_),
          authors_are_complete(c("Yuting Wang", "Xiaotao Shen")))
a <- list(list(given="Yuting", family="Wang"), list(name="HuBMAP Consortium"),
          list(given="Xiaotao", family="Shen"))
stopifnot(identical(parse_crossref_authors(a), c("Yuting Wang", "HuBMAP Consortium", "Xiaotao Shen")),
          is.null(parse_crossref_authors(c(a, list(list(family="Unknown"))))),
          is.null(parse_crossref_authors(list(list(given="X", family="Shen")))) )
stopifnot(identical(parse_crossref_authors(data.frame(given=c("Yuting","Xiaotao"),family=c("Wang","Shen"))), c("Yuting Wang","Xiaotao Shen")))
# Every current publication must have a real, non-truncated author list.
for (path in list.files("content/publication", "^index.md$", recursive=TRUE, full.names=TRUE)) {
  lines <- readLines(path, warn=FALSE); fences <- which(lines == "---")
  meta <- yaml::yaml.load(paste(lines[(fences[1]+1):(fences[2]-1)],collapse="\n"))
  stopifnot(length(meta$authors)>0, !any(grepl("\\.\\.\\.|…|et al\\.",meta$authors)))
}
cat("PASS: reject truncated/initial-only imports, preserve collective authors, fail closed on missing names, audit all publication lists.\n")
