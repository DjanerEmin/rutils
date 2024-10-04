#' Simple Feature from WKT
#'
#' Create a simple feature from a well known text
#'
#'
#'
#' @param x \code{character}. Geometry as WKT
#'
#' @return \code{sfc}
#' @export
#'
#' @examples
#'
#' string <- "MULTIPOLYGON (((-19.8394 18.1518, -19.1212 20.7523,  -24.6239 30.3655, -25.1478 30.4619,  -30.9179 20.4919, -30.4307 20.4011, -28.0359 19.9526,  -20.9466 18.4181, -20.4804 18.3004, -20.0118 18.1969, -19.8394 18.1518)))"
#'
#' st_from_wkt(string, crs = 4326)


st_from_wkt <- function(x, crs){
    x <- sf::st_as_sfc(x)

    if (!missing(crs)){
        x <- sf::st_set_crs(x, crs)
    }

    x
}
