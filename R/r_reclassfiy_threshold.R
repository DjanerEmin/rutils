#' Reclassify raster based on threshold
#'
#' Wrapper around \code{terra::classify()} which creates
#' the reclassification matrix from \code{threshold}, \code{becomes}
#'
#' @param r         raster to reclassify
#' @param threshold sequence of threshold values
#' @param becomes   the output classes
#' @param ...       parameters to \code{terra::classify}
#'
#' @return
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' # make everything above 50 to be 50 and everything below NA
#' res<- r_reclassify_threshold(a, 50, c(NA, 50))
#' res
#' plot(res)

r_reclassify_threshold <- function(r, threshold, becomes, ...) {

    if(length(threshold) != length(becomes) - 1) stop("length(becomes) == 1+length(threshold) is not TRUE")

    rcl <- as.matrix(data.frame(from    = c(-Inf, threshold),
                                to      = c(threshold, Inf),
                                becomes = becomes))

    terra::classify(r, rcl, ...)
}

