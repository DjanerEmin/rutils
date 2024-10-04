#' Raster layer has data
#'
#' Checks if layer is empty
#'
#' @param r is a spatRaster
#'
#' @return logical indicating indices of the layers with data
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' a_r<- raster::stack(system.file("ex/logo.tif", package="terra"))
#' res<- r_hasdata_layer(a)
#'res
#'
r_hasdata_layer <- function(r) {
    which(!is.na(terra::global(r, min)))
}
