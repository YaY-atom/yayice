#' Load Yice Analytics UI dependencies
#'
#' Adds the CSS dependencies used by yayice UI components.
#'
#' @return An HTML dependency object.
#'
#' @export
yice_dependencies <- function() {

  htmltools::htmlDependency(
    name = "yayice",
    version = as.character(utils::packageVersion("yayice")),
    src = c(
      href = "yice",
      file = system.file("yice", package = "yayice")
    ),
    stylesheet = "yice.css",
    package = "yayice"
  )
}
