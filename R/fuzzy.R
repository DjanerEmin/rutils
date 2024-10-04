#' Fuzzy functions
#'
#' Returns a fuzzy function
#'
#'
#'TODO implement those in https://search.r-project.org/CRAN/refmans/sets/html/fuzzyfuns.html
#'
#' @param shape of the relationship one of \code{c("trapezoid", "triangular", "normal")}
#' @param breaks cornerpoints for the inflection points. 4 - trapezoid, 3 - triangular
#'
#' @return
#' @export
#'
#' @examples
#'
#' x <- 1:100
#' trap <- fuzzy("trapezoid", breaks = c(20, 40, 60, 80))
#' plot(x, trap(x))

#' trian <- fuzzy("triangular", breaks = c(25, 50, 75))
#' plot(x, trian(x))

fuzzy <- function(shape  = c("trapezoid", "triangular", "normal", "linear"),
                  breaks = c(1,2,3,4)) {
    if (shape == "trapezoid")
        f <- sets::fuzzy_trapezoid(breaks)
    if (shape == "triangular")
        f <- sets::fuzzy_triangular(breaks)
    if (shape == "linear")
        f <- function(x){
            ret <- 1 - x/breaks
            ret[x > breaks] <- 0
            ret
        }

    return(f)

}
