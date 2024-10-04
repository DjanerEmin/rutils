#' Expand/Grow a polygon shape
#'
#' This function is used to expand the shapefile beyond its boundaries.
#' This is useful when a layer needs to be slightly bigger than the AOI to which
#' it has been cut.
#'
#' Be careful with the how much you grow the area. The bigger the buffer the bigger the error.
#' works good with 10-50 m and can go up to 200m if polygons are big enough.
#'
#' @param x  object of class \code{sf} polygon
#' @param buffer the distance to grow
#'
#' @return x object with the last polygon being the expanded geometry
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' x<- st_as_sf(terra::ext(30,50,30,50) %>% terra::vect())
#' res <- st_grow_shape(x, 10)
#' plot(a[[1]])
#' plot(res, add = TRUE)
#' # the inner polygon is the original polygon,
#' # the outer polygon was generated


st_grow_shape <- function(x, buffer){
    # keep only the boundary sliver
    boundary <- sf::st_difference(sf::st_union(sf::st_buffer(x, buffer)))
    rbind(x, boundary)
}
