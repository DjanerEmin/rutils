#' Take the file name
#'
#' Return the filename without extension.
#'
#' Wrapper around \code{fs::path_ext_remove(fs::path_file(x))}
#'
#' @param x path string
#' @param ext logical. Whether to keep the extension. Default is FALE
#'
#' @return
#' @export
#'
#' @examples
path_basename <- function(x, ext = FALSE){
    x <- fs::path_file(x)

    if (!ext) {
        x <- fs::path_ext_remove(x)
    }

    return(x)
}
