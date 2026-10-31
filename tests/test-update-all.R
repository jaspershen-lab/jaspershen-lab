# Offline orchestration checks; uses fake updaters, never changes site data.
options(shenlab.update_all.autorun = FALSE)
source("R/update_all.R", chdir = TRUE)
repo <- normalizePath(getwd())
stopifnot(identical(environment(update_all)$default_root, repo))
fixture <- tempfile("shen-update-")
dir.create(file.path(fixture, "R"), recursive = TRUE)
dir.create(file.path(fixture, "content", "publication"), recursive = TRUE)
dir.create(file.path(fixture, "content", "authors"), recursive = TRUE)
scripts <- c(add_publications = "googlescholar2shenlab",
             add_publication_summary = "googlescholar2pubsummary",
             add_publication_wordcloud = "publication2wordcloud",
             add_collaborator_map = "googlescholar2collabmap")
for (name in names(scripts)) {
  writeLines(sprintf('%s <- function(...) { cat("%s\\n", file="calls.txt", append=TRUE); NULL }',
                     scripts[[name]], name), file.path(fixture, "R", paste0(name, ".R")))
}
result <- update_all(fixture, verbose = FALSE)
stopifnot(identical(readLines(file.path(fixture, "calls.txt")), names(scripts)),
          length(result) == 4L, identical(getwd(), repo))
writeLines('googlescholar2pubsummary <- function(...) stop("network unavailable")',
           file.path(fixture, "R", "add_publication_summary.R"))
error <- tryCatch(update_all(fixture, verbose = FALSE), error = identity)
stopifnot(inherits(error, "error"), grepl("summary.*network unavailable", conditionMessage(error)),
          identical(getwd(), repo))
# Verify the default source-only invocation runs, from outside the repository.
file.copy(file.path(repo, "R", "update_all.R"), file.path(fixture, "R"))
writeLines('googlescholar2pubsummary <- function(...) NULL',
           file.path(fixture, "R", "add_publication_summary.R"))
setwd(tempdir())
options(shenlab.update_all.autorun = TRUE)
source(file.path(fixture, "R", "update_all.R"), local = new.env())
stopifnot(identical(getwd(), normalizePath(tempdir())))
setwd(repo)
unlink(fixture, recursive = TRUE)
cat("PASS: ordering, source-only autorun, root detection, NULL results, errors and working-directory restoration.\n")
