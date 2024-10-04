#' Bearing matrices
#'
#' Wedge matrices in 8 directions for use in focal
#'
#' @format ## `bearings`
#' A list object
"bearings"


#' Corine land cover nomenclature
#'
#' A dataset containing the codes and names for the Corine Land Cover Classification
#'
#' @format A data frame with 44 rows and 5 variables:
#' \describe{
#'   \item{value}{three digit CLC code}
#'   \item{color}{hexadecimal color code}
#'   \item{level1-3}{Class name for each abstraction level }
#'   ...
#' }
#'
#' @example
#' head(clc_meta)
#' @source \url{https://developers.google.com/earth-engine/datasets/catalog/COPERNICUS_CORINE_V20_100m}
"clc_meta"
