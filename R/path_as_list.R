#' Create a list of paths
#'
#' This function creates a named list with full paths from a vector of paths.
#' 
#' By default cleans the starting digits if any. E.g. will remove \code{01} from \code{foo/01_data}
#'
#' @param x vector of paths to put in a list
#'
#' @return
#' @export
#'
#' @examples
#' x <- c("foo/foo", "foo/bar", "foo/baz")
#' path_as_list(x)
#' 
path_as_list <- function(x){
  
  out <- list()
  for (folder in x){
    f <- janitor::make_clean_names(fs::path_file(folder),
                                   replace = c("^\\d+" = ""))
    out[[f]] <- folder
  }
  
  return(out)
}
