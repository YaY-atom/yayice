#' Load Yice Analytics UI dependencies
#'
#' Adds the visual design system used by yayice UI components.
#'
#' Colours are generated from the central `yice_colors()`
#' palette and exposed to CSS as custom properties.
#'
#' During development, the Yice stylesheet is embedded directly
#' into the page so that CSS changes are immediately visible
#' without browser dependency caching.
#'
#' @param mode Either `"light"` or `"dark"`.
#'
#' @return Yice Analytics UI dependencies and configuration.
#'
#' @export
yice_dependencies <- function(
    mode = getOption("yayice.mode", "dark")
) {

  mode <- match.arg(
    mode,
    c("light", "dark")
  )

  col <- yice_colors()


  # =========================================================
  # BUILD CSS VARIABLES FROM CENTRAL R PALETTE
  # =========================================================

  css_variables <- sprintf(
    "
    :root {

      --yice-primary: %s;
      --yice-primary-dark: %s;
      --yice-primary-light: %s;

      --yice-cyan: %s;
      --yice-cyan-soft: %s;
      --yice-cyan-dark: %s;

      --yice-purple: %s;
      --yice-purple-soft: %s;
      --yice-purple-dark: %s;

      --yice-gradient-start: %s;
      --yice-gradient-mid: %s;
      --yice-gradient-end: %s;

      --yice-success: %s;
      --yice-warning: %s;
      --yice-danger: %s;
      --yice-info: %s;

      --yice-light-background: %s;
      --yice-light-surface: %s;
      --yice-light-surface-soft: %s;

      --yice-light-text: %s;
      --yice-light-text-soft: %s;
      --yice-light-text-muted: %s;

      --yice-light-border: %s;

      --yice-dark-background: %s;

      --yice-dark-surface: %s;
      --yice-dark-surface-2: %s;
      --yice-dark-surface-3: %s;

      --yice-dark-text: %s;
      --yice-dark-text-soft: %s;
      --yice-dark-text-muted: %s;

      --yice-dark-border: %s;

    }
    ",

    col[["primary"]],
    col[["primary_dark"]],
    col[["primary_light"]],

    col[["cyan"]],
    col[["cyan_soft"]],
    col[["cyan_dark"]],

    col[["purple"]],
    col[["purple_soft"]],
    col[["purple_dark"]],

    col[["gradient_start"]],
    col[["gradient_mid"]],
    col[["gradient_end"]],

    col[["success"]],
    col[["warning"]],
    col[["danger"]],
    col[["info"]],

    col[["background"]],
    col[["surface"]],
    col[["surface_soft"]],

    col[["text"]],
    col[["text_soft"]],
    col[["text_muted"]],

    col[["border"]],

    col[["background_dark"]],

    col[["surface_dark"]],
    col[["surface_dark_2"]],
    col[["surface_dark_3"]],

    col[["text_dark"]],
    col[["text_dark_soft"]],
    col[["text_dark_muted"]],

    col[["border_dark"]]
  )


  # =========================================================
  # LOCATE CURRENT YICE CSS
  # =========================================================

  css_file <- system.file(
    "yice",
    "yice.css",
    package = "yayice"
  )

  if (!nzchar(css_file)) {

    stop(
      "Could not locate yayice CSS file.",
      call. = FALSE
    )
  }


  # =========================================================
  # RETURN UI DEPENDENCIES
  # =========================================================

  shiny::tagList(


    # -------------------------------------------------------
    # Dynamic colour variables
    # -------------------------------------------------------

    shiny::tags$style(
      shiny::HTML(
        css_variables
      )
    ),


    # -------------------------------------------------------
    # Current Yice stylesheet
    #
    # Embedded directly to prevent stale browser caching
    # while developing yayice.
    # -------------------------------------------------------

    shiny::includeCSS(
      css_file
    ),


    # -------------------------------------------------------
    # Theme mode
    # -------------------------------------------------------

    shiny::tags$script(

      shiny::HTML(

        sprintf(
          "
          document.documentElement.setAttribute(
            'data-yice-theme',
            '%s'
          );
          ",
          mode
        )
      )
    )
  )
}
