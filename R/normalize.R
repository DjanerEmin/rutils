#' Title
#'
#' The normalize() function is based on the Min-Max Scaling method. The normalized values fall in
#  between 0 and 1.

#' TODO: Rewrite to work on vector

#' @param x spatRaster
#'
#' @return spat raster with range 0-1
#' @export
#'
#' @examples
normalize <- function(x){
    #x - min(x)/ max(x) - min(x)
    x_range <- terra::global(x, range, na.rm = TRUE)
    x_min <- min(x_range)
    x_max <- max(x_range)
    x_norm <- (x - x_min) / (x_max - x_min)
    return(x_norm)
}
