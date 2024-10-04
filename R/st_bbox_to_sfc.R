#' Spatial object bbox as sfc
#'
#' Extracts extent from a spatial object and convert to sfc
#' @param x   bbox or object from which bbox can be calculated. See \code{st_bbox()}
#'
#' @return  sfc
#' @export
#'
#' @examples
st_bbox_as_sfc <- function(x){
    sf::st_as_sfc(sf::st_bbox(x), crs = sf::st_crs(x))
}
