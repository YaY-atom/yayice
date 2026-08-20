#' Show yayice package information
#'
#' Displays basic information about the currently installed
#' version of the yayice package.
#'
#' @return Invisibly returns a list containing package information.
#' @export
yice_info <- function() {

  info <- list(
    package = "yayice",
    version = as.character(utils::packageVersion("yayice")),
    author = "Yusuf Adni Yavuz",
    project = "Yice Analytics"
  )

  cat(
    "\n",
    "Yice Analytics R Toolkit\n",
    "------------------------\n",
    "Package:  ", info$package, "\n",
    "Version:  ", info$version, "\n",
    "Author:   ", info$author, "\n",
    "Project:  ", info$project, "\n",
    sep = ""
  )

  invisible(info)
}

