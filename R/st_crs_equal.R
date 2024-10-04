#' Are CRS equal
#'
#' Checks whether two spatial objects have the same `crs`
#'
#' @param x  spatial object on which `st_crs()` can be called
#' @param y  spatial object on which `st_crs()` can be called
#'
#' @return  Logical
#' @export
#'
#' @examples
st_crs_equal <- function(x,y){
  sf::st_crs(x) == sf::st_crs(y)
}
