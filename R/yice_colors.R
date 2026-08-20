#' Yice Analytics colour palette
#'
#' Central colour definitions used throughout the yayice UI system.
#'
#' @return A named character vector.
#'
#' @export
yice_colors <- function() {

  c(
    # Brand
    primary        = "#003CFF",
    primary_dark   = "#002BCC",
    primary_light  = "#5477FF",

    accent         = "#42FCFF",
    accent_alt     = "#D535D9",

    # Light surfaces
    background     = "#F6F7FB",
    surface        = "#FFFFFF",
    surface_soft   = "#F9FAFC",

    # Dark surfaces
    background_dark = "#0B0D12",
    surface_dark    = "#12151C",
    surface_dark_2  = "#181C25",

    # Text
    text           = "#17181C",
    text_soft      = "#555B66",
    text_muted     = "#828895",

    text_dark      = "#F4F6FA",
    text_dark_soft = "#B7BDC9",

    # Semantic
    success        = "#00C000",
    warning        = "#FCA600",
    danger         = "#FF3B45",
    info           = "#42FCFF",

    # Structure
    border         = "#E5E8EF",
    border_dark    = "#292E3A"
  )
}
