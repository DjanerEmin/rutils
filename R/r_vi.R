#'  Vegetation (Spectral) indices
#'
#' Calculate a suite of multispectral indices such as NDVI, SAVI etc.
#'
#' This function knows which bands it needs to calculate the selected indices
#' and searches for them in \code{names(x)}. Accepted band names are
#' \code{"blue", "green", "red", "re1", "re2", "re3", "nir1", "nir2", "swir1", "swir2"}.
#'
#' If not all bands are available the function will calculate only those indices which are possible
#' and throw a warning.
#'
#' Use \code{rutils::bandnames()} with \code{setNames()} to set the names properly.
#'
#'
#'
#' @param x           \code{terra::rast} object with band names set to those
#'                    returned by rutils::bandnames(). If missing returns all implemented indices
#'
#'
#' @param indices     index to calculate. If missing calculates all indices.
#'
#' @param aoi         sf object. If provided, raster is cropped to this aoi
#'
#' @param cores       number of cores to use for parallel processing
#'
#' @param writeRaster whether to write output to disc. If \code{filename} is
#'                    not specified, it will write to the same location
#'                    as the source file.  If the source file contains the
#'                     string \code{"10-Band"} it will be replaced with
#'                    index name. Otherwise will append the index at the end of
#'                    the source file name (e.g. \code{"filename_NDVI.tif"}.
#'
#' @param outfolder   the folder where to write the file. the filename is taken from x. The same rules
#'                     for appending index as above. It will be ignored if \code{filename} is given.
#'
#'@param filename     filename to write to a specific location. The same rules
#'                     for appending index as above. If given overwrites \code{outfolder}
#'
#' @param overwrite   whether to overwrite if \code{writeRaster = TRUE}
#'
#' @param clamp_evi   whether or not to clamp EVI to range(-1,1)
#'
#' @param wopt        list of further options for \code{terra::writeRaster()}
#'
#'
#' @return            named \code{list} with \code{rast} objects for each index
#' @export
#'
#' @examples
#' # run empty to see which indices are currently implemented
#' r_vi()
#'
#' # bulk calculate all possible indices
#' s <- rast(system.file("ex/logo.tif", package="terra"))
#' r_vi(s)
#'
#' # NDVI is not possible
#' r_vi(s, "NDVI")
#' TODO:: delete r_vi in changeR and make changeR load this one
r_vi <- function(x, indices = NULL, aoi, cores = 1, writeRaster = FALSE, outfolder, filename, overwrite = FALSE, clamp_evi = TRUE, wopt = list()){

    idxDB <-
        list(
            EVI     = function(nir1, red, blue)         2.5 * (nir1 - red) / ((nir1 + 6*red - 7.5*blue) + 10000),
            EVI_clamped = function(nir1, red, blue){
                x<- 2.5 * (nir1 - red) / ((nir1 + 6*red - 7.5*blue) + 10000)
                ifelse(abs(x) > 1, sign(x), x)
            },
            NBR     = function(nir1, swir1)              (nir1 - swir1)/(nir1 + swir1),
            NMDI    = function(nir2, swir1, swir2)      (nir2 - (swir1 - swir2))/(nir2 + (swir1 - swir2)) ,
            SAVI    = function(nir1, red)             ((nir1 - red) / (nir1 + red + 500)) * (10000 + 500),
            SIPI1   = function(nir1, red, blue)         (nir1 - blue) / (nir1 - red),
            NDVI    = function(nir1, red)               (nir1 - red) / (nir1 + red),
            CIG     = function(nir1, green)             (nir1 / green) - 1,
            CVI     = function(nir1, red, green)         nir1 * (red / (green * green)),
            DSWI    = function(nir1, green, swir2, red) (nir1 + green) / (swir2 + red),
            GLI     = function(green, red, blue)        (2 * green - red - blue) / (2 * green + red + blue),
            NDVI    = function(nir1, red)               (nir1 - red) / (nir1 + red),
            NDYI    = function(green, blue)             (green - blue) / (green + blue),
            NGRDI   = function(green, red)              (green - red) / (green + red),
            RGI     = function(red, green)              red / green,
            RDVI    = function(nir, red)                (nir1 - red) / sqrt(nir1 + red)
        )


    if (inherits(x, "character")) x <- terra::rast(x)

    if(missing(x)) {

        print(paste("Currently implemented indices:", paste(names(idxDB), collapse = ", ")))


    } else {

        x <- stats::setNames(x, tolower(names(x)))

        if (!any(names(x) %in% rutils::bandnames())) {
            stop("Band names are not set properly. Allowed band names are: ",
                    paste(rutils::bandnames(), collapse = ", "),
                    call. = FALSE)

        }

        if (is.null(indices)){
            ind <- names(idxDB)
        } else if (indices == "eo4sdg") {
            ind <- c("EVI", "NBR", "NDVI", "NMDI", "SAVI", "SIPI1")
        } else{
            ind <- toupper(indices)
        }

        if (("EVI" %in% ind) && clamp_evi) ind <- stringr::str_replace(ind, "EVI", "EVI_clamped")

        if(!any(ind %in% c(names(idxDB)))){
            stop("Indices must either be NULL to calculate all indices",
                 "\nor character vector containing some of: ",
                 paste(names(idxDB), collapse = ", "),
                 call. = FALSE)
        }

        args <- purrr::map(idxDB[ind], ~names(formals(.)))
        bands_available <- purrr::map_lgl(args, ~ all(. %in% names(x)))

        if (!any(bands_available)) {
            stop("Neither of the indices can be calculated using the available bands.
                 \nDid you named bands in x properly. Allowed band names area: ",
                 paste(rutils::bandnames(), collapse = ", "),
                 call. = FALSE)
        }


        possible <- names(bands_available)[bands_available]


        if (length(ind) > length(possible)) {

            warning("Some bands required to calculate the selected indices were missing or not named properly.
                    \nConsider setting names using `rutils::bandnames()`",
                    call. = FALSE)
        }

        ind <- ind[ind %in% possible]

        # construct file name
        filenames <- list()
        if (writeRaster){
            for (i in ind) {
                if (!missing(filename)){
                    source <- filename
                } else if (!missing(outfolder)) {
                    source <- fs::path(outfolder, fs::path_ext_set(fs::path_file(terra::sources(x)), "tif"))
                } else {
                    source <- terra::sources(x)
                }



                if (stringr::str_detect(source, "10-Band")){
                    filenames[[i]] <- rutils::replace_10band(source, i)
                } else {
                    filenames[[i]] <- rutils::path_insert(source, i, 99)
                }

            }
        } else {
            for (i in ind) {
                filenames[[i]] <- ""
            }
        }

        message(paste("Calculating indices", paste(ind, collapse = ", ")))

        out <- list()
        for (i in ind) {

            out[[i]] <-
                terra::lapp(x,
                            fun       = idxDB[[i]],
                            usenames  = TRUE,
                            cores     = cores,
                            filename  = filenames[[i]],
                            overwrite = overwrite,
                            wopt      = wopt)

        }


        # for debugging
        # out <- list(ind, possible)
        return(out)

    }

}



