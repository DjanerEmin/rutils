#' Extract position of filename string
#'
#' Used to extract a a certain position based on splitting regexp from a string (typically a filename). If the string is the \code{form/of/a/long/path}, the path will be drooped
#'
#' @param string    string (typically a filename) from which a prefix is to be extracted
#' @param pos       the position of the prefix in the string (default 1 - first prefix)
#' @param sep       the separator which divides the prefix from the rest of the string
#'
#' @return          String
#' @export
#' @examples
#' x <- c("foo/bar.ext", "long/path/foo/baz.ext")
#' path_extract(x, pos = 1, sep = "a")
#' path_extract(x, pos = 2, sep = "a")


path_extract <- function(string, pos = 1,  sep = "_") {
    .extract_prefix <- function(x){
        stringr::str_split(tools::file_path_sans_ext(fs::path_file(x)), sep, simplify = T)[[pos]]
    }

    if (length(string) > 1) {
        unname(purrr::map_chr(string, .extract_prefix))}
    else {
        .extract_prefix(string)
    }

}
