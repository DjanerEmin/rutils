#' Remove duplicates
#'
#' Removes duplicate geometries
#'
#' @param sf a spatial object of class `sf`
#'
#' @return
#' @export
#'
#' @examples
st_remove_duplicates <- function(sf){
    sf::st_as_sf(dplyr::distinct(as.data.frame(sf::st_coordinates(sf)), X, Y), coords=1:2, crs=sf::st_crs(sf))
}
