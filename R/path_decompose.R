#' Decompose path
#'
#' Decomposes a path string into its main elements: \code{directory}, \code{filename}, and \code{extension}
#'
#' \code{path_compose()} NB! Experimental. It iss the opposite function, e.g. reverts back the decomposed.
#'
#' @param x path or a data.frame of decomposed paths (for \code{pathcompose()}
#'
#' @return returns a tibble with columns  \code{dir}, \code{name}, and \code{ext}
#' @export
#'
#' @examples
#' x <- c("foo/bar.ext", "long/path/foo/baz.ext")
#' path_decompose(x)
path_decompose <- function(x){
    dplyr::tibble(dir  = fs::path_dir(x),
           name = fs::path_file(fs::path_ext_remove(x)),
           ext  = fs::path_ext(x))
}

#' @rdname path_decompose
path_compose <- function(x){

    out <- vector()
    for (row in 1:nrow(x)){
        out[row] <- fs::path(x[["dir"]][row], x[["name"]][row], ext = x[["ext"]][row])
    }

    return(out)
}

