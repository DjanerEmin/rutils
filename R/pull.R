#' Pull element
#'
#' Pull an element from a list like object. Same as \code{x[[v]]}.
#' For use in native pipe synthax
#'
#' \code{pull(x, v)} is same as \code{x[[v]]}
#'
#' \code{first(x)} is same as \code{x[[1]]}
#'
#' \code{last(x)} is same as \code{x[[length(x)]]}
#'
#' @param x list like object
#' @param v the elements to pull
#'
#' @return
#' @export
#'
#' @examples
#' x <- list(1,2,3)
#' pull(x, 2)
#' first(x)
#' last(x)
#'
pull <- function(x, v){
    x[[v]]
}

#' @rdname pull
first <- function(x){
    x[[1]]
}

#' @rdname pull
last <- function(x){
    x[[length(x)]]
}
