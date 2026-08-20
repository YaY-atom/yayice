#' Create the Yice Analytics UI theme
#'
#' Creates the base Bootstrap theme for Yice Analytics applications.
#'
#' @param mode UI colour mode. Either `"light"` or `"dark"`.
#' @param primary Optional primary brand colour.
#'
#' @return A bslib theme.
#'
#' @export
yice_theme <- function(
    mode = getOption("yayice.mode", "light"),
    primary = NULL
) {

  mode <- match.arg(mode, c("light", "dark"))

  col <- yice_colors()

  if (is.null(primary)) {
    primary <- col[["primary"]]
  }

  if (mode == "light") {

    bg <- "#F6F7FB"
    fg <- "#17181C"

  } else {

    bg <- "#07090F"
    fg <- "#F5F7FF"

  }

  theme <- bslib::bs_theme(
    version = 5,
    preset = "bootstrap",

    bg = bg,
    fg = fg,

    primary = primary,
    secondary = col[["text_muted"]],

    success = col[["success"]],
    warning = col[["warning"]],
    danger = col[["danger"]],
    info = col[["info"]],

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
      "Cascadia Code",
      "Consolas",
      "monospace"
    ),

    "border-radius" = "0.75rem",
    "border-radius-sm" = "0.5rem",
    "border-radius-lg" = "1rem"
  )

  attr(theme, "yice_mode") <- mode

  theme
}
