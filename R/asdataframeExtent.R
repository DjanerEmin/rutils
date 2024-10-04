#' as.data.frame method for extent
#'
#' Method for as.data.frame for extent objects
#'
#' @param x           extent
#' @param row.names   optional
#' @param optional
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#' res<- terra::ext(30, 50, 30, 50)
#' as.data.frame.Extent(res)
#'

as.data.frame.Extent <- function(x, row.names, optional, ...){
    x<- unname(as.vector(x))
    data.frame(xmin=x[1], xmax=x[2], ymin=x[3], ymax=x[4], ...)
}
