#' Recursive search for files with extension \code{.tif$}
#'
#' @param database location to search in, it will search all subfolders (recursive search)
#' @param pattern  optionally, a further pattern to subset by. passed to \code{stringr::str_subset}
#' @param negate   weather to invert the subsetting and keep those record not matching the pattern
#'
#' @return
#' @export
#'
#' @examples
path_tifs <- function(database = ".", pattern, negate = FALSE){

    x <- fs::dir_ls(database, regexp = "tif$", recurse = TRUE, fail = FALSE)

    if (!missing(pattern)) {
        return(stringr::str_subset(string = x, pattern = pattern, negate = negate)) # can use str_detect..
    } else{
        return(x)
    }
}
