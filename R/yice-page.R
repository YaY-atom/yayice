#' Create a Yice Analytics page
#'
#' Creates a full-page Yice Analytics application layout with
#' controlled background lighting and UI dependencies.
#'
#' @param ... UI elements displayed on the page.
#' @param mode Either `"light"` or `"dark"`.
#' @param max_width Maximum width of the page content.
#' @param padding Page padding.
#'
#' @return A bslib fillable page.
#'
#' @export
yice_page <- function(
    ...,
    mode = getOption("yayice.mode", "dark"),
    max_width = "1200px",
    padding = "3rem 2rem 5rem 2rem"
) {

  mode <- match.arg(
    mode,
    c("light", "dark")
  )

  bslib::page_fillable(

    theme = yice_theme(mode),

    yice_dependencies(mode),

    shiny::div(

      class = "yice-page",

      # =====================================================
      # BACKGROUND
      # =====================================================

      shiny::div(

        class = "yice-page-background",

        `aria-hidden` = "true",

        shiny::div(
          class = "yice-light yice-light-blue"
        ),

        shiny::div(
          class = "yice-light yice-light-cyan"
        ),

        shiny::div(
          class = "yice-light yice-light-purple"
        ),

        shiny::div(
          class = "yice-light yice-light-center"
        )
      ),


      # =====================================================
      # CONTENT
      # =====================================================

      shiny::div(

        class = "yice-page-content",

        style = sprintf(
          "
          max-width: %s;
          padding: %s;
          ",
          max_width,
          padding
        ),

        ...
      )
    )
  )
}
