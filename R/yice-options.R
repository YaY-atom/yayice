#' Get or set yayice options
#'
#' Provides a central configuration system for yayice.
#'
#' @param ... Named yayice options to set.
#'
#' @return
#' If no arguments are supplied, returns the current yayice options.
#' Otherwise invisibly returns the previous values.
#'
#' @export
yice_options <- function(...) {

  dots <- list(...)

  option_names <- c(
    theme = "yayice.theme",
    mode = "yayice.mode",
    primary = "yayice.primary",
    background = "yayice.background",
    foreground = "yayice.foreground",
    radius = "yayice.radius",
    plot_theme = "yayice.plot_theme"
  )

  if (length(dots) == 0) {

    return(list(
      theme = getOption("yayice.theme", "default"),
      mode = getOption("yayice.mode", "light"),
      primary = getOption("yayice.primary", "#003CFF"),
      background = getOption("yayice.background", "#FFFFFF"),
      foreground = getOption("yayice.foreground", "#18181B"),
      radius = getOption("yayice.radius", "0.75rem"),
      plot_theme = getOption("yayice.plot_theme", "yice")
    ))
  }

  unknown <- setdiff(names(dots), names(option_names))

  if (length(unknown) > 0) {
    stop(
      "Unknown yayice option(s): ",
      paste(unknown, collapse = ", "),
      call. = FALSE
    )
  }

  r_options <- stats::setNames(
    dots,
    option_names[names(dots)]
  )

  invisible(options(r_options))
}
