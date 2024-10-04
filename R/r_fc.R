#' Rescale to 0 - 1
#'
#' rescale a raster from 0 to the specified upper threshold
#'
#' @param x object of class \code{SpatRaster}
#' @param upper upper threshold to clamp the raster
#' @param wopt additional list of named arguments to \code{terra::app}
#' @param filename character. passed to \code{terra::writeRaster}
#' @param clamp whether to clamp 
#'
#' @return rescaled raster
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_fc(a, upper = 100)
#' plot(res)
#' # with no clamping:
#' res2<- r_fc(a, upper = 100, clamping = FALSE)
#' plot(res2)

r_fc <- function(x, upper = 0.3, filename="", clamp = TRUE, wopt = list()){

    if (clamp) x <- terra::clamp(x, lower = 0, upper = upper)


    if(!"" %in% names(x)) wopt$names <- names(x)

    range <- terra::global(x, range)
    range <- range[[2]] - range[[1]]
    min <- min(terra::global(x, min))

    out <-
        terra::app(x,
                   fun = function(x, min, range) (x - min)/ range,
                   min = min,
                   range = range,
                   wopt = wopt,
                   filename = filename)
    gc()

    return(out)

}
