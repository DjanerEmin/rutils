#' NIR-Red-Green plot of a multi-layered SpatRaster
#'
#' @param x SpatRaster
#' @param r
#' @param g
#' @param b
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
plotFCC <- function(x, r = 4, g = 1, b = 2, ...){
    terra::plotRGB(x,r = r, g = g, b = b, ...)
}
