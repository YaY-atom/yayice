#' Yice Analytics colour palette
#'
#' Central colour definitions used throughout the yayice UI system.
#'
#' This function acts as the single source of truth for Yice Analytics
#' brand, surface, text, semantic, and gradient colours.
#'
#' @return A named character vector of hexadecimal colours.
#'
#' @export
yice_colors <- function() {

  c(
    # =========================================================
    # BRAND
    # =========================================================

    primary = "#003CFF",
    primary_dark = "#0028B8",
    primary_light = "#5B7CFF",

    cyan = "#42FCFF",
    cyan_soft = "#9BFFFF",
    cyan_dark = "#12BFC7",

    purple = "#D535D9",
    purple_soft = "#ED7CF0",
    purple_dark = "#9E1FA4",


    # =========================================================
    # GRADIENT
    # =========================================================

    gradient_start = "#003CFF",
    gradient_mid = "#42FCFF",
    gradient_end = "#D535D9",


    # =========================================================
    # LIGHT MODE
    # =========================================================

    background = "#F6F7FB",

    surface = "#FFFFFF",
    surface_soft = "#F9FAFC",

    text = "#17181C",
    text_soft = "#555B66",
    text_muted = "#828895",

    border = "#E5E8EF",


    # =========================================================
    # DARK MODE
    # =========================================================

    background_dark = "#07090F",

    surface_dark = "#0F131D",
    surface_dark_2 = "#121722",
    surface_dark_3 = "#171D29",

    text_dark = "#F5F7FF",
    text_dark_soft = "#C2C8D6",
    text_dark_muted = "#818A9D",

    border_dark = "#292E3A",


    # =========================================================
    # SEMANTIC
    # =========================================================

    success = "#00C000",
    warning = "#FCA600",
    danger = "#FF3B45",
    info = "#42FCFF"
  )
}
