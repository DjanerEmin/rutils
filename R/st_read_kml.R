#' Read a kml or kmz file
#'
#' Loads a KML or KMZ as sf
#' @param file  the full file path
#'
#' @return
#' @export
#'
#' @examples
st_read_kml <- function(file) {
    # get file extension
    ext <- strsplit(basename(file), split = '\\.')[[1]][-1]

    # if kml
    if (ext == 'kml') {
        layers <- sf::st_layers(file)$name

        if (length(layers) > 1) {
            return(Reduce('rbind', lapply(layers, sf::read_sf, dsn = file)))
        }

        return(sf::read_sf(file))
    } else {
        target_file <- '.temp.kml.zip'

        fs::file_copy(file, target_file, overwrite = T)
        unzip(target_file, overwrite = T)

        sf_out <- sf::read_sf('doc.kml')

        fs::file_delete(target_file)
        fs::file_delete('doc.kml')

        return(sf_out)
    }
}
