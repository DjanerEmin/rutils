#' Find a closest date
#'
#' Find the closest date among a vector of dates. Any NA values are removed
#'
#' @param among vector of class Date to pick from
#' @param to   the targeted date
#'
#' @return
#' @export
#'
#' @examples
#' dates <- as.Date(c("2010-01-01", "2010-05-01"))
#' date  <- as.Date("2010-01-05")
#'
#' closest_date(among = dates , to = date)

closest_date <- function(among, to){
    if(any(is.na(among))) among<- among[!is.na(among)]
    return(among[which(abs(among - to) == min(abs(among - to)))])
}
