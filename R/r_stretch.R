#' Stretch raster
#'
#' Histogram equalization stretch of a raster image. A linear stretch is provided by
#' `terra::stretch`. Note that \code{terra::stretch} now also provides histogram equalization
#' via the argument \code{histeq = TRUE}. Function adapted for backwards compatibility
#' with old code.
#'
#' @param x    raster
#' @param bit  bit rate
#' @param ...  further arguments to `writeRaster`
#'
#' @return
#' @export
#'
#' @examples
#'
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_stretch(a)
#' res
#' plot(a*1)
#' plot(res)

r_stretch <- function(x, bit = 16, ...){
    ecdfun <- stats::ecdf(terra::values(x))
    return(terra::app(x, fun=function(x) round(ecdfun(x)* (2^bit)), ...))
}
