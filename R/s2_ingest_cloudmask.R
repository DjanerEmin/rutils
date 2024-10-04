#' Ingest Sentinel-2 Cloud Mask from .SAFE data
#'
#' This function loads and saves the cloud mask layer available in the .SAFE folder containing
#' Sentinel-2 scene. The bands area resampled to 10m spatial resolution.
#'
#' Currently works only for Level-2A products.
#'
#'
#'
#'
#' @param path      path to an unzipped .SAFE folder
#'
#' @param outfolder the folder where to write the file. the filename is taken from the .SAFE file
#'
#' @param return    whether to return a \code{terra::rast} object back into the session - default.
#'                  Otherwise returns the path to the newly created \code{tif}
#'
#' @param ...       further parameters to \code{writerRaster}
#'
#' @return
#' @export
#'
#' @examples
#' # set outfolder and create if need
#' outfolder <- "data/cloudmask"
#' rutils::path_exists(outfolder, create = TRUE)
#'
#'
#' r <- s2_ingest_cloudmask(path = path, outfolder = outfolder)

s2_ingest_cloudmask <- function(path, outfolder, return = TRUE, ...){
    file <- fs::dir_ls(path, recurse = T, regexp = "CLDPRB_20")
    mask <- terra::rast(file)

    filename <- fs::path_ext_set(rutils::path_insert(fs::path_file(path), "cloudmask", 99), "tif")
    outfilename <- fs::path(outfolder, filename)

    rd <- terra::disagg(mask, 2, filename = outfilename, datatype = "INT1U", ...)

    if (return){
        out <- rast(outfilename)
    } else {
        out <- outfilename
    }

    return(out)

}
