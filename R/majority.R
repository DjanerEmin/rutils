#' Majority
#'
#' Find the most frequent element in a vector. Returns it as numeric by default!
#'
#' @param x        a vector
#' @param numeric  Logical, whether to return a numeric
#'
#' @return
#' By default returns a character
#' @export
#'
#' @examples
#'
#' x <- c(1,2,2)
#' majority(x, numeric = TRUE) # otherwise will return "2" (character)

majority <- function(x, numeric = FALSE) {

    out <- names(which.max(table(x)))

    if(numeric) out <- as.numeric(out)

    out
}

