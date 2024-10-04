#' Transform bounding box
#'
#' Reproject the bbox (extend) of a spatial object
#'
#' @param x      bbox or an object from which a bbox can be extracted
#' @param crs    the target crs
#'
#' @return       bbox object
#' @export
#' @seealso st_bbox_to_sfc
#'
st_bbox_transform <- function(x, crs){
    sf::st_bbox(sf::st_transform(sf::st_as_sfc(sf::st_bbox(x)), crs))
}
