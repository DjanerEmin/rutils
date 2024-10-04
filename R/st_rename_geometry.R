#' Rename Geometry Column
#'
#' give a new name to a `geometry` column in `sf, sfc`
#'
#' @param g    the spatial object `sf`
#' @param name the new name to be given
#'
#' @return
#' @export
#'
#' @examples
st_rename_geometry <- function(g, name){
  current = attr(g, "sf_column")
  names(g)[names(g)==current] = name
  sf::st_geometry(g)=name
  g
}
