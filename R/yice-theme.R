#' Create the Yice Analytics UI theme
#'
#' Creates a Bootstrap 5 theme using the current yayice
#' design options.
#'
#' @param mode Either `"light"` or `"dark"`.
#' @param primary Primary accent colour.
#'
#' @return A `bslib::bs_theme()` object.
#'
#' @export
yice_theme <- function(
    mode = getOption("yayice.mode", "light"),
    primary = getOption("yayice.primary", "#003CFF")
) {

  mode <- match.arg(mode, c("light", "dark"))

  if (mode == "light") {
    bg <- "#FFFFFF"
    fg <- "#18181B"
    secondary <- "#6B7280"
  } else {
    bg <- "#111318"
    fg <- "#F5F5F5"
    secondary <- "#A1A1AA"
  }

  bslib::bs_theme(
    version = 5,
    preset = "bootstrap",

    bg = bg,
    fg = fg,

    primary = primary,
    secondary = secondary,

    success = "#00C000",
    info = "#42FCFF",
    warning = "#FCA600",
    danger = "#FF0000",

    base_font = bslib::font_collection(
      "Inter",
      "Segoe UI",
      "Arial",
      "sans-serif"
    ),

    heading_font = bslib::font_collection(
      "Inter",
      "Segoe UI",
      "Arial",
      "sans-serif"
    ),

    code_font = bslib::font_collection(
      "JetBrains Mono",
      "Consolas",
      "monospace"
    ),

    "border-radius" = getOption(
      "yayice.radius",
      "0.75rem"
    ),

    "card-border-radius" = getOption(
      "yayice.radius",
      "0.75rem"
    )
  )
}
