#' Read Excel to list
#'
#' Reads entire excel or selected sheets into a list.
#' A for-loop Wrapper around \code{readxl::read_excel()} to recursively read all or selected sheets.
#' always returns a list. so if you want to load only one sheet you might be better off using \code{read_excel()}
#'
#' Names of sheets are used to name the list elements.
#'
#' @param path character. path to \code{.xlsx} file
#' @param sheets either numeric vector representing sheet number, or character vector.
#' If \code{NULL} it will read all sheets (default)
#' giving the names of the sheets
#'
#' @return
#' @export
#'
#' @examples
read_excel_sheets <- function(path, sheets = NULL){


    if(is.null(sheets)) sheets <- readxl::excel_sheets(path)

    out <- list()

    for(sheet in sheets) {

        out[[sheet]] <- readxl::read_excel(path, sheet = sheet)

    }

    out

}


