#' Find Tile name
#'
#' Extracts the tile identifier from Sentinel-2 file name.
#'
#' @param path string. Path to standard Sentinel-2 file.
#'
#' @return
#' @export
#'
#' @examples
path_tile <- function(path) {
    rutils::path_extract(rutils::path_basename(path), pos = 2)


    # method for sf
    # tiles[st_transform(path, crs = st_crs(tiles)),][["Name"]]
}
