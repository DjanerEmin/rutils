#' Detect Processing level of Sentinel-2 file
#'
#'
#' @param path  the full path to Sentinel-2 file
#' @param assume string to return if no match found
#' @param capitalize whether to return the level as capital letters. Default to \code{FALSE}
#'
#' @return  String One of \code{"l1c", "l2a"}
#' @export
#'
#' @examples
#'
#' path <- "S2A_MSIL2A_20190120T103341_N0211_R108_T32UNB_20190120T131644.SAFE"
#'
#' s2_detect_level(path)
#'
s2_detect_level <- function(path, assume = "l2a", capitalize = FALSE){
  level <- c(l1c ="MSIL1C",
             l2a = "MSIL2A")

  out <- names(level[stringr::str_detect(path, level)])

  if(length(out)==0) {
    out <- assume
    warning(glue::glue("Could not deduce the processing level from string, Assuming '{assume}'."))
  }

  if (capitalize) out <- toupper(out)


  return(out)
}
