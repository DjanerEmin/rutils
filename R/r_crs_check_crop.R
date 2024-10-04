#' Crop with crs check
#'
#' CRS safe crop. Checks if the crs of y is same as this of x and transforms it if not.
#'
#' @param x spatial raster
#' @param y object of class sf
#' @param ... further parameters to `\code{\link[terra]{crop}} and \code{\link[terra]{writeRaster}}
#'
#' @return
#' @export
#'
#' @examples
r_crs_check_crop <- function(x, y, ...){

    if (!rutils::st_crs_equal(x, y)){
        y <- sf::st_transform(y, sf::st_crs(x))
    }

    terra::crop(x, y, ...)
}
