#' File search
#'
#' Recursive search for files in given path, which will not fail if access is denied.
#' A wrapper around \code{fs::dir_ls(..., recurse = T, fail = F)}
#'
#' @param path   path to search in
#' @param regexp regular expression
#'
#' @return
#' @export
#'
#' @examples
#' path_find(".") # prints everything in your current directory!

path_find <- function(...){
    fs::dir_ls(..., recurse = T, fail = F)
}
