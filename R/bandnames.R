#' Band names
#'
#' Most common band names as character vector
#'
#' @param x currently one of \code{c("s2", "rgb", "rgbnir")}
#' @param smallcaps
#'
#' @return
#' @export
#'
#' @examples
#' bandnames(smallcaps = TRUE)
bandnames <- function(x = "s2_fullname", smallcaps = TRUE){
    out <-
        switch(x,
               s2 = {c("B", "G", "R", "RE1", "RE2", "RE3", "NIR1", "NIR2", "SWIR1", "SWIR2")},
               s2_fullname = {c("BLUE", "GREEN", "RED", "RE1", "RE2", "RE3", "NIR1", "NIR2", "SWIR1", "SWIR2")},
               rgb = {c("R", "G", "B")},
               rgbnir = {c("R", "G", "B", "NIR")})

    if (smallcaps){
        tolower(out)
    } else {
        out
    }
}

