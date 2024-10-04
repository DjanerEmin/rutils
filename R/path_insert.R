


.insert <- function(s, string, pos, sep = "_"){
    if (pos >= length(s)){

        a <- c(s, string)

    } else if (pos == 0) {

        a <- c(string, s)

    } else {

        a <- c(s[1:pos], string, s[(pos+1):length(s)])
    }

    return(paste(a, collapse = sep))
}




#' Insert string
#'
#' Insert a string  at specific separation of the filename portion of a path.
#'
#' \code{path_insert("path/file_name.ext", "foo", 1)} -> \code{"path/file_foo_name.ext"}
#'
#' @param x        string to be edited
#' @param string   string to be inserted
#' @param pos      position to be inserted to
#' @param sep      separator passed to \code{str_split} to identify positions
#'
#' @return
#' @export
#' @note  if  the string is inserted AFTER the position.
#'        \code{pos = 0} the string is pasted at first place, if \code{pos >= length(str_split(x))} the string
#'        is appended to the end of the string.
#'
#'
#' @examples
path_insert <- function(x, string, pos,  sep = "_"){

    x <- path_decompose(x)
    s <- stringr::str_split(x$name, pattern = sep)
    a <- unlist(purrr::map_chr(s, .insert, string = string, pos = pos, sep = sep))
    x$name <- a

    path_compose(x)
}


