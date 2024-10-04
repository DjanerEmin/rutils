#' Raster cell has data across all cells in a stack
#'
#' TODO: rewrite is.na(r)
#' @param r      raster stack
#' @param na.rm  if TRUE tests if ALL cells are NA, if FALSE test if ANY cell is NA
#'
#' @return a vector with the indices of the cells with non-NA values
#' @export
#'
#' @examples
#' a<- terra::rast(system.file("ex/logo.tif", package="terra"))
#' res<- r_hasdata_cell(a)
#' res

r_hasdata_cell <- function(r, na.rm = TRUE) {
    which(!is.na(terra::values(max(r, na.rm = na.rm))))
}
