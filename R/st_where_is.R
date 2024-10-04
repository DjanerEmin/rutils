#' Where is an object located
#' 
#' Finds where a given spatial object is located geographically. E.g. on which continent or in which country.
#'
#' @param x object of type sf
#' @param desc  one of continent or country
#'
#' @return
#' @export
#'
#' @examples
st_where_is <- function(x, desc = "continent"){
    if(!rutils::st_crs_equal(x, rutils::world)) x <- sf::st_transform(x, sf::st_crs(rutils::world))

    sf::st_drop_geometry(sf::st_intersection(rutils::world, x)[,desc])


}
