#' Vectorize
#'
#' Convert a raster to a vector. Works in memory. Use with caution with big raster.
#' Note vectorize from the terra should also be enough
#'
#' @param x  raster layer
#'
#' @return
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_vectorize(a)
#' res
#' plot(res)
r_vectorize <- function(x){
    stars::st_as_stars(x) %>%
        st_as_sf(as_points = F, merge = T)

}
