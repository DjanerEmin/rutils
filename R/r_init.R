#' Initialize a constant raster
#'
#' Casts a raster from a single value
#' Not needed anymore bc \code{terra::init(x, 1)} is the same 
#'
#' @param x     spatRaster object from which to take the metadata
#' @param const numeric value to be used as constant for the entire raster
#' @param ...   further parameters to \code{writeRaster}
#'
#' @return spatRaster
#' @export
#'
#' @examples
#'
#' r <- terra::rast(ncols=36, nrows=18)
#'
#' r_init_const(r, 1)
#'
#' # Equivalent to:
#' const <- 1
#' set_const <- function(x){rep(const, x)}
#' init(r, fun=set_const)
r_init_const <- function(x, const, ...){
    terra::init(x,
                 fun = function(x) rep(const, x),
                 ...)
}
