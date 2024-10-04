#' UTM Zone
#'
#' Find UTM Zone from spatial object or x y coordinates
#' TODO: implement a raster method
#'
#' @param x longitude or Spatial object of class sf or sp
#' @param y latitude or missing
#' @param proj4string boolean
#'
#' @return
#' @export
#'
#' @examples
#' utm_zone(6, 24)
#'
#' # if a polygon is give, takes its centroid
#' library(sf)
#' bayern <- germany.sf[germany.sf$NAME_1 == "Bayern", ]
#' utm_zone(bayern)
#'
setGeneric("utm_zone", function(x, y, proj4string=FALSE){
    standardGeneric("utm_zone")
})


#' @rdname utm_zone
#' @aliases utm_zone,numeric,numeric,logical-method
setMethod("utm_zone", signature("numeric", "numeric"),
          function(x, y, proj4string) {
              return(gfcanalysis::utm_zone(x, y, proj4string))
          }
)

#' @rdname utm_zone
#' @aliases utm_zone,numeric,numeric,logical-method
setMethod("utm_zone", signature("Spatial", "missing"),
          function(x, y, proj4string) {
              return(gfcanalysis::utm_zone(x, y, proj4string))
          }
)



#' @rdname utm_zone
#' @importFrom sf st_centroid st_coordinates
#' @aliases utm_zone,Spatial,missing,logical-method
setMethod("utm_zone", signature(x="sf", y="missing"),
          function(x, proj4string) {
              x <- sf::st_transform(x, 4236)
              centroid <- sf::st_coordinates(sf::st_centroid(x))
              return(gfcanalysis::utm_zone(centroid[1,1], centroid[1,2], proj4string))
          }
)

setMethod("utm_zone", signature(x="SpatRaster", y="missing"),
          function(x, proj4string) {
              centroid<- x |> ext() |> (function(x) {c((x[1] + x[2])/2, ((x[3] + x[4])/2))})()
              return(gfcanalysis::utm_zone(centroid[1], centroid[2], proj4string))
          }
)
