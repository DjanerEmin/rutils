#' Mask out small patches
#'
#' This function  masks patches of a clumped raster smaller than user defined size (in pixels). The clumped raster
#' has to have unique value for each clump (as produced by \code{terra::patches}).
#'
#' @param r           clumped raster to be analyzed, as produced by \code{terra::patches}
#'
#' @param patch.size  minimum patch size to be kept (pixels). All patches smaller than (<) this value are masked out
#' @param ...         further parameters passed to \code{writeRaster}
#' @return            Raster
#' @seealso \link[gdfR]{r_mask_fill}
#'
#' @examples
#' library(terra)
#'
#' r <- terra::rast(ncol = 10, nrow = 10)
#' values(r) <- runif(100)
#' r[r<0.7] <- NA
#'
#' clumped <- patches(r, directions = 8)
#' plot(clumped)
#' masked <- r_mask_patches(clumped, 2)
#' plot(masked)


r_mask_patches <- function(r, patch.size = 30,  ...){

    freq <- terra::freq(r)
    ids <- freq[, "value"][which(freq[, "count"] < patch.size)]

    if(!length(ids)) stop("No patches are smaller than patch.size")

    # return
    terra::subst(r, ids, rep(NA, length(ids)), ...)
}
