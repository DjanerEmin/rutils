#' Does a folder exist
#'
#' Slightly more powerful check. It checks if a folder exists, creates it if \code{create = TRUE} (the default)
#'
#' @param path    The path to be checked
#' @param silent  logical. whether to return answer or remain silent.
#' @param create  logical. Should the folder be created?
#' @param verbose If TRUE and \code{silent = TRUE} returns the path. Useful for filename creation
#'
#' @return
#'                If \code{check = TRUE} returns the result from \code{dir.exists}
#'                If \code{create = TRUE} creates folder if missing
#'                If \code{verbose = TRUE} returns the path, otherwise silent .
#' @export
#'
path_exists <- function(path, silent = TRUE, create = FALSE, verbose = FALSE){

    exists <- dir.exists(path)

    if(silent) {
        exists
    } else{
        if (!exists) {

            if(create) {

                fs::dir_create(path)

                if (verbose) return(path)
            }

            if(!create & verbose) print("Folder does not exist,
                                    use path_exists(create = TRUE) to create.")

        } else if (verbose) {

            path

        }
    }

}

#
#
# if (create) {
#
# }
#
#
# rc <- function(x1,x2,x3,x4) {
#     ifelse( x1 > 0.2, x2, x3)
# }


# path_exists <- function(path){
#     exists <- dir.exists(path)
#
#     if (exists){
#         if (verbose){
#             out
#         }
#     }
# }
#
#
# foo <- function(s){
#     silent(s)
# }
#
# silent
# foo(1)
