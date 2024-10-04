#' Multiplicator helper
#'
#' A helper function to create a function which
#' multiplies by a specific number
#'
#' @param x  the multiplicator
#'
#' @return A function
#' @export
#'
#' @examples
#' double <- multiplicator(2)
#' triple <- multiplicator(3)
#' quadruple <- multiplicator(4)
#'
#' x <- 1:3
#' double(x)
#' triple(x)
#' quadruple(x)
multiplicator <- function(x){
    function(y) x * y
}
