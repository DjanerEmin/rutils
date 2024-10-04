#' Country geometry
#'
#' Queries the \code{rutils::world} dataset and returns a country of choice.
#'
#' TODO: make it work with many countries
#'
#' English name of countries required. e.g. one of \code{print(rutils::world$name)}
#'
#' @param country \code{character} the name of the country
#'
#' @return an \code{sf} object
#' @export
#'
#' @examples
st_country <- function(country){
    rutils::world[rutils::world$name == country, ]
}
