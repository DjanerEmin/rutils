#' Fill holes
#'
#' Fill holes in mask image
#'
#' @param r  spatRaster image with holes (NA)
#' @param hole.size maximum hole size (in pixels) to close
#' @param directions should be 4 or 8 (default), for rook or queen neigbhours respectively.
#' @param ...  further arguments to `raster::writeRaster`
#' @return mask raster with holes filled
#' @export
#' @seealso r_mask_patches
#' @import magrittr
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
#'
#' masked_fill<- r_mask_fill(r, Inf)
#' plot(masked_fill)
#'
#'
r_mask_fill <- function(r, hole.size, directions = 8, ...){
    tempfile <- purrr::map(rep("image", 3), fs::file_temp, ext = "tif")

    out <-
        r %>%
        r_mask_invert(filename = tempfile[[1]]) %>%
        terra::patches(filename = tempfile[[2]],
                      directions = directions,
                      datatype = "INT4U") %>%
        r_mask_patches(patch.size = hole.size,
                          filename = tempfile[[3]])

    out2<- r_mask_invert(out, ...)

    fs::file_delete(unlist(tempfile))

    # for some reason, file_delete deletes the temp file created by the
    # out2 call
	# osc rewrite?
	# later TODO : compare functions...

    return(out2)
}
