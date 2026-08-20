#' Load Yice Analytics UI dependencies
#'
#' Adds the visual design system used by yayice UI components.
#'
#' @param mode Either `"light"` or `"dark"`.
#'
#' @return HTML dependencies and Yice UI configuration.
#'
#' @export
yice_dependencies <- function(
    mode = getOption("yayice.mode", "light")
) {

  mode <- match.arg(
    mode,
    c("light", "dark")
  )

  shiny::tagList(

    htmltools::htmlDependency(
      name = "yayice",
      version = as.character(
        utils::packageVersion("yayice")
      ),
      src = c(
        href = "yice",
        file = system.file(
          "yice",
          package = "yayice"
        )
      ),
      stylesheet = "yice.css",
      package = "yayice"
    ),

    shiny::tags$script(
      shiny::HTML(
        sprintf(
          "
          document.addEventListener(
            'DOMContentLoaded',
            function() {
              document.documentElement.setAttribute(
                'data-yice-theme',
                '%s'
              );
            }
          );
          ",
          mode
        )
      )
    )
  )
}
