#' Extract date from a (path) string
#'
#' Originally created to extract the date from the Sentinel-2 filename.
#' Work reliably only for Sentinel-2 filenames
#'
#' NB!: it will extract only the first match
#' TODO: make a generic function to search for a date-like substring
#'
#' @param x       string containing a date portion.
#'                Currently only searches for this pattern \code{20220103T140533}
#'
#' @param format  output date format.
#' @param convert whether to convert to the specified format. If \code{FALSE} will return the literal string
#'
#' @return
#' @export
#'
#' @examples
path_date <- function(x, format = "%Y%m%dT%H%M%S", convert = TRUE){

    out <- stringr::str_extract(x,"(?<=A)\\d{7}(?=.)|(?<=_)\\d{8}T\\d{6}(?=_)")

    if(convert) out <- as.Date(out, tryFormats = c("%Y%m%dT%H%M%S",  "%Y%j"))

    return(out)
}


