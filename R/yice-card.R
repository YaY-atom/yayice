#' Create a Yice Analytics card
#'
#' Creates a reusable card component using bslib with
#' Yice Analytics defaults for spacing and styling.
#'
#' @param ... UI elements placed inside the card body.
#' @param title Optional card title.
#' @param description Optional short description shown below the title.
#' @param full_screen Whether the card may be expanded to full screen.
#' @param class Optional additional CSS classes.
#'
#' @return A bslib card component.
#'
#' @export
yice_card <- function(
    ...,
    title = NULL,
    description = NULL,
    full_screen = FALSE,
    class = NULL
) {

  header <- NULL

  if (!is.null(title) || !is.null(description)) {

    header <- bslib::card_header(
      shiny::div(
        class = "yice-card-header",

        if (!is.null(title)) {
          shiny::div(
            class = "yice-card-title",
            title
          )
        },

        if (!is.null(description)) {
          shiny::div(
            class = "yice-card-description",
            description
          )
        }
      )
    )
  }

  bslib::card(
    class = paste(
      "yice-card",
      class
    ),
    full_screen = full_screen,

    header,

    bslib::card_body(
      ...
    )
  )
}
