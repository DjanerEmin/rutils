#' Invert mask
#'
#' Produce the opposite (negative) mask
#'
#' @param mask   input mask
#' @param ...    additional arguments for writing files as in writeRaster
#'
#' @return raster with values 1 and NA
#' @export
#'
#' @examples
#' library(terra)
#' r <- rast(ncol = 10, nrow = 10)
#' values(r) <- runif(100)
#' r[r<0.7] <- NA
#' plot(r)
#'
#' inverted <- r_mask_invert(r)
#' plot(inverted)
r_mask_invert <- function (mask, ...){

    tempfile <- fs::file_temp(ext = "tif")

    tmp <- not.na(r,  filename = tempfile, datatype = "INT1U")

    inverse_mask <- subst(tmp, FALSE, 1, others = NA, datatype = "INT1U", ...)

    fs::file_delete(tempfile)

    return(inverse_mask)
}


#
# r_mask_patches()
# r_remove_patches()


