#' Split a data frame to chunks.
#'
#'  Calculates the size of the chunk internally
#' The last chunk being the smallest.
#'
#' Split a data frame like object to smaller data frames
#'
#' @param df  a data.frame or object from which nrow() can be taken
#'
#' @param n   number of chunks
#'
#' @return
#' @export
#'
#' @examples
#' df_split(mtcars, 3)
df_split <- function(df, n) {
    nr <- nrow(df)
    split(df, rep(1:ceiling(nr/n), each=n, length.out=nr))
}
