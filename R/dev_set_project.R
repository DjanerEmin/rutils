#' Set Project
#'
#' Convenient wrapper around \code{\link[usethis]{create_package}} to set up a project. Only works from within the project.
#'
#' Workflow:
#'
#' \enumerate{
#'     \item Create a GitLab repository and initiate a new project with version control from within RStudio.
#'     \item run \code{dev_set_project()}
#' }
#'
#' Parameters passed to \code{...}
#'
#' \enumerate{
#'   \item \code{fields} A named list of fields to add to \code{DESCRIPTION},
#'                      potentially overriding default values. See \code{\link[usethis]{use_description}}
#'                      for how you can set personalized defaults using package options.
#' }
#'
#' @param type          one of  \code{package}, or  \code{project}
#'
#' @param dirs          vector of dirs to create. If missing, creates \code{"data"},  \code{"analysis"}, and   \code{"R"} folders
#'
#' @param open          Whether to activate the new project and open a new RStudio sesion.
#'
#' @param check_name    Whether to check if the name is valid for CRAN and throw an error
#'
#' @param ...   further options to \code{\link[usethis]{create_package}}
#'
#' @return
#' @export
#'
#' @examples
dev_set_project <- function(path, type = c("package", "project"), dirs, open = FALSE, check_name = FALSE, ...){

    if (type[[1]] == "package"){
        usethis::create_package(path, open = open, check_name = check_name, ...)
    } else {
        usethis::create_project(path)
    }


    if (missing(dirs)) dirs <- c("data", "analysis", "R")

    for (dir in dirs) usethis::use_directory(dir)
}

