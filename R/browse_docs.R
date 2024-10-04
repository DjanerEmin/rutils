#' Browse Package Website
#'
#' Opens package website.
#'
#' \code{browse_wiki()} is a shorthand for \code{browse_docs("wiki")}
#'
#' check for valid package names using \code{fs::path_file(fs::dir_ls(getOption("path")$docs))}
#'
#' @param package the package name. Opens \code{gdfR} if nothing provided
#'
#' @return
#' @export
#'
#' @examples
#' # browse_documentation("gdfR")
browse_docs <- function(package){

    if (missing(package)) package <- "rutils"

    docs <- getOption("path")$docs
    implemented_packages <- fs::path_file(fs::dir_ls(docs))
    if (!package %in% implemented_packages) {
        stop(paste("'package must be one of: ", paste(implemented_packages, collapse = ", ")))
    }

    # if (package %in% internal_packages){
    #     internal <- TRUE
    # }
    #
    internal <- TRUE
    if (internal){
        packagepath <- fs::path(docs, package, "index", ext = "html")
    }

    system(glue::glue("open {packagepath}"))
}

#' @rdname browse_docs
browse_wiki <- function(){

    packagepath <- fs::path(getOption("path")$docs, "wiki", "index", ext = "html")

    system(glue::glue("open {packagepath}"))
}
