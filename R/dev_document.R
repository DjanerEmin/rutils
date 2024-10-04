#' Document outside of package
#'
#' This function creates an html documentation outside of package.
#'
#' @param x                path to a \code{function.R} file. if not supplied it will look for the \code{R} folder in the current working directory.
#'
#' @param output_directory defaults to \code{man} in the current working directory. will be created if does not exist.
#'
#' @return
#' @export
#'
#' @examples
dev_document <- function(x, output_directory = "man"){

  if (missing(x)) {
    path <- "R"
    if(!path_exists(path, check = T)) stop("No functions given and there is no R folder")
    x <- fs::dir_ls("R")
  }

  rutils::path_exists(output_directory, create = TRUE)


  for (fun in x){
      ~document::document(fun,
                          output_directory = output_directory,
                          check_package = FALSE)
  }

}
