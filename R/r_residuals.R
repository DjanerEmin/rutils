#' Calculate residuals image
#'
#' Calculates an image of linear fit residuals \code{residuals.lm(lm((y~x))}
#'
#' @param x       the predictor raster
#' @param y       the predictant raster. If missing \code{x} must be a raster with two layers
#'                (or list length 2 of one-layer rasters), where first layer \code{x[[1]]} is the predictor (x)
#'                and the second layer \code{x[[2]]} is the predictant (y)
#' @param ...      arguments passed to \code{writeRaster}
#'
#' @return  \code{raster}
#' @export
#' TODO:: Add rule to get subsample if raster is too large
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_residuals(a[[1]], a[[2]])
#' res
#' plot(res)
#'
r_residuals <- function(x, y, ... ) {

    if(missing(y)){
        y <- x[[2]]
        x <- x[[1]]
    }

    rr <- stats::residuals.lm(stats::lm(terra::values(y) ~ terra::values(x), na.action=na.exclude))

    #return
    terra::init(y, function(x) rr, ...)
}

