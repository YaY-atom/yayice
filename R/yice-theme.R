#' Create the Yice Analytics UI theme
#'
#' Creates the base Bootstrap theme for Yice Analytics applications.
#'
#' Colours are derived from the central `yice_colors()` palette.
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

  mode <- match.arg(
    mode,
    c("light", "dark")
  )

  col <- yice_colors()


  # ---------------------------------------------------------
  # Primary colour
  # ---------------------------------------------------------

  if (is.null(primary)) {
    primary <- unname(col[["primary"]])
  }


  # ---------------------------------------------------------
  # Mode colours
  # ---------------------------------------------------------

  if (mode == "light") {

    bg <- unname(
      col[["background"]]
    )

    fg <- unname(
      col[["text"]]
    )

  } else {

    bg <- unname(
      col[["background_dark"]]
    )

    fg <- unname(
      col[["text_dark"]]
    )
  }


  # ---------------------------------------------------------
  # Bootstrap theme
  # ---------------------------------------------------------

  theme <- bslib::bs_theme(

    version = 5,

    preset = "bootstrap",

    bg = bg,

    fg = fg,

    primary = primary,

    secondary = unname(
      col[["text_muted"]]
    ),

    success = unname(
      col[["success"]]
    ),

    warning = unname(
      col[["warning"]]
    ),

    danger = unname(
      col[["danger"]]
    ),

    info = unname(
      col[["info"]]
    ),


    # -------------------------------------------------------
    # Fonts
    # -------------------------------------------------------

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


    # -------------------------------------------------------
    # Bootstrap geometry
    # -------------------------------------------------------

    "border-radius" = "0.80rem",

    "border-radius-sm" = "0.55rem",

    "border-radius-lg" = "1.05rem"
  )


  attr(
    theme,
    "yice_mode"
  ) <- mode


  theme
}
