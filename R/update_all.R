# One-command update from the repository root:
# source("R/update_all.R")
# To load the function without running it:
# options(shenlab.update_all.autorun = FALSE)
# source("R/update_all.R")
# update_all(scholar_url = "3TK9yz8AAAAJ")

update_all <- local({
  # Capture the source file location, including source(..., chdir = TRUE).
  source_files <- lapply(sys.frames(), function(frame) frame$ofile)
  source_files <- Filter(function(x) is.character(x) && length(x) == 1L,
                         source_files)
  default_root <- if (length(source_files)) {
    source_path <- tail(source_files, 1L)[[1L]]
    if (!file.exists(source_path)) source_path <- basename(source_path)
    dirname(dirname(normalizePath(source_path, mustWork = TRUE)))
  } else {
    normalizePath(getwd(), mustWork = TRUE)
  }

  function(project_dir = default_root, scholar_url = "3TK9yz8AAAAJ",
           max_pubs = 200, verbose = TRUE) {
    project_dir <- normalizePath(project_dir, mustWork = TRUE)
    scripts <- c("add_publications.R", "add_publication_summary.R",
                 "add_publication_wordcloud.R", "add_collaborator_map.R")
    paths <- file.path(project_dir, "R", scripts)
    missing_files <- paths[!file.exists(paths)]
    if (length(missing_files)) {
      stop("Missing update scripts: ", paste(missing_files, collapse = ", "),
           call. = FALSE)
    }
    if (!dir.exists(file.path(project_dir, "content", "publication")) ||
        !dir.exists(file.path(project_dir, "content", "authors"))) {
      stop("project_dir must be the Shen Lab website repository.", call. = FALSE)
    }
    packages <- c("tidyverse", "scholar", "httr", "xml2", "rvest",
                  "rcrossref", "stringi", "jsonlite", "dplyr", "stringr",
                  "purrr", "tidyr", "tidygeocoder")
    missing_packages <- packages[!vapply(packages, requireNamespace, logical(1),
                                        quietly = TRUE)]
    if (length(missing_packages)) {
      stop("Missing packages. Run:\ninstall.packages(c(",
           paste(sprintf('"%s"', missing_packages), collapse = ", "),
           "))\nThen source R/update_all.R again.", call. = FALSE)
    }

    previous_dir <- setwd(project_dir)
    on.exit(setwd(previous_dir), add = TRUE)
    # Keep helper functions out of the user's global workspace.
    helpers <- new.env(parent = globalenv())
    for (path in paths) sys.source(path, envir = helpers)

    steps <- list(
      publications = function() helpers$googlescholar2shenlab(
        scholar_url = scholar_url, publication_dir = "content/publication",
        update_citations = TRUE, verbose = verbose),
      summary = function() helpers$googlescholar2pubsummary(
        scholar_url = scholar_url, verbose = verbose),
      keywords = function() helpers$publication2wordcloud(verbose = verbose),
      collaborators = function() helpers$googlescholar2collabmap(
        scholar_url = scholar_url, authors_dir = "content/authors",
        max_pubs = max_pubs, verbose = verbose)
    )
    results <- vector("list", length(steps))
    names(results) <- names(steps)
    for (i in seq_along(steps)) {
      step <- names(steps)[i]
      if (verbose) message(sprintf("[%d/%d] Updating %s...", i, length(steps), step))
      value <- tryCatch(steps[[i]](), error = function(e) {
        stop("Update failed at '", step, "': ", conditionMessage(e),
             "\nEarlier steps may already have written files; they were not rolled back.",
             call. = FALSE)
      })
      results[i] <- list(value)
    }
    if (verbose) message("All four updates completed. No Hugo build, Git commit, or push was run.")
    invisible(results)
  }
})

if (isTRUE(getOption("shenlab.update_all.autorun", TRUE))) {
  update_all()
}
