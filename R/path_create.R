#' Create a folder
#'
#' Wrapper around \code{fs::dir_create(path(path, folder))}
#'
#'
#' @param folder folders to create
#' @param path   parent path
#'
#' @return
#' @export
#'
#' @examples
path_create <- function(folder, path = ".") {
    fs::dir_create(fs::path(path, folder))
}
