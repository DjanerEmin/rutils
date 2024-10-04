#' Procentuate
#'
#' Convert a vector into a percent proportion of its sum
#'
#' @param x
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
procentuate <- function(x, ...){
    units::set_units(round(100*x/sum(x, ...), 2), "%")
}
