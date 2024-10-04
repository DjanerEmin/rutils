
#' Trim matrix
#'
#' @param distance
#' @param resolution
#'
#' @return
#' @export
#'
#' @examples
adjust_window <- function(distance, resolution){


    npix <- round(distance/resolution,0)


    dim <- dim(rutils::bearings[[1]])[1]


    if(npix > dim){
        stop("we have a problem")
    }

    if (npix < 2){
        stop("matrix is smaller than 3x3")
    }

    if((npix %% 2) == 0 ){
        npix <- npix + 1
    }

    if(npix > dim){
        stop("we have a problem")
    } else if(npix == dim) {
        rem <- 0
    } else {
        rem <- (dim - npix)/2
    }

    out <- list()
    for(direction in names(rutils::bearings)){
        out[[direction]] <-
            trim_matrix(rutils::bearings[[direction]], rem, rem)
    }

    return(out)
}


#' Trim matrix on each side
#'
#' Removes n number of rows and columns on each side of a matrix
#'
#' a 5x5 matrix with nx == nx = 1 will become a 3x3 matrix
#' (e.g. will remove the first and last col and rows)
#'
#' @param m
#' @param row numeric. number of rows to trim on each side
#' @param col numeric. number of cols to trim on each side
#'
#' @return
#' @export
#'
#' @examples
#'
#' m <-
#' matrix(rep(1:9, each = 9), ncol = 9) +
#' matrix(rep(seq(10,90, by = 10), each = 9), ncol = 9, byrow = T)
#'
#' m
#'
#' trim_matrix(m, 1, 2)


trim_matrix <- function(m, row, col){


    keepcol <- (1+col):(ncol(m) - col)
    keeprow <- (1+row):(nrow(m) - row)

    m[keeprow, keepcol]
}


