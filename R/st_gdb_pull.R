#' Pull a layer from GDB
#'
#' Pull a layer from GDB optionally cropping it to an extend. In fact,
#' if no cropping extend is provided this function is the same as
#' \code{sf::st_read(gdb, layer)}
#'
#' @param gdb    Geodatabase (path)
#' @param layer  Layer name (character)
#' @param aoi    Either a path to or an sf object for the ptional extent to crop to. (reprojected to \code{st_crs(gdb)})
#'
#' @return
#' @export
#'
#' @examples
st_gdb_pull <- function(gdb, layer, aoi){

    s  <-  sf::st_make_valid(sf::st_read(gdb, layer = layer))

    if (!missing(aoi)){

        if (inherits(aoi, "character")) aoi <- sf::st_read(aoi)

        intersection <- sf::st_intersection(s, sf::st_make_valid(sf::st_transform(aoi, sf::st_crs(s))))

        return(intersection)

    } else {
        return(s)
    }

}
