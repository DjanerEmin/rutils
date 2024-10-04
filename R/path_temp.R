#' path_temp <- function(ext = "", tempdir = "temp"){
#'
#'     if (missing(tempdir)) tempdir =
#'
#' }
#'
#'
#'
#' #' @export
#' timestamp <- function(time = Sys.time(), format = "%Y%m%d_%H%M%S") format(time, format)
#'
#'
#' #' @export
#' timestamp_now <- function(format = "%Y%m%d_%H%M%S") format(Sys.time(), format)
#'
#'
#' #' @export
#' datestamp <- function(date = Sys.time(), format = "%Y%m%d") format(date, format)
#'
#' #' @export
#' outfile_path <- function(infile) {
#'     paste0(timestamp_now(), "_", sub("(.*)([.]csv$)", "\\1_clean\\2", infile))
#' }
#'
#' temp_image <- function(tempdir = "temp"){
#'     if(!fs::dir_exists(tempdir)) fs::dir_create(tempdir)
#'     fs::file_temp("image", tmp_dir = fs::path(getwd(), tempdir), ext = "tif")
#' }
#'
#'
#' temp_file <- function(ext = "", tempdir = "temp"){
#'     if(!fs::dir_exists(tempdir)) fs::dir_create(tempdir)
#'     fs::file_temp("file", tmp_dir = fs::path(getwd(), tempdir), ext = ext)
#' }
