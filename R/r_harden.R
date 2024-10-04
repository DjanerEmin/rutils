#' Harden a soft raster layer
#'
#' Produce a Mask layer from a raster with continuous values by converting
#' all values bellow \code{threshold} into 1 and everything else into NA.
#'
#' TODO: user-defined value instead of 1
#' TODO: user-defined value instead of NA
#' TODO: keep = TRUE to keep original values
#' TODO: explain how to include or exclude the threshold (include.lowest, right options in reclassify)
#' TODO: see if its worth merging with r_reclassify_threshold
#'
#' @param r         spatRaster object
#' @param threshold numeric threshold value
#' @param above     invert the mask, e.g. keep pixels with values above the threshold as 1
#' @param ...       further arguments to \code{terra::classify}, useful to decide how to treat the \code{threshold}
#'                  e.g \code{include.lowest, right}`
#'
#' @return
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_harden(a, 100)
#' res
#' # plot(res)

r_harden <- function(r, threshold, above = FALSE, ...){
    if(above){
        rcl <- matrix(c(-Inf, threshold, NA, threshold, Inf, 1), ncol = 3, byrow = TRUE)
    } else{
        rcl <- matrix(c(-Inf, threshold, NA, threshold, Inf, 1), ncol = 3, byrow = TRUE)
    }
    terra::classify(r, rcl, ...)
}
