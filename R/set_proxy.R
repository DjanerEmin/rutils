#' Set proxy
#'
#' silently sets a proxy
#'
#' @param proxy string. the proxy address  
#'
#' @return
#' @export
#'
#' @examples
set_proxy <- function(proxy = ""){
    Sys.setenv(HTTP_PROXY = proxy)
    Sys.setenv(HTTPS_PROXY = proxy)
}
