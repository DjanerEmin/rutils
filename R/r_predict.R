#' Spatial model predictions
#'
#' A wrapper around \code{terra::predict} for models build using \code{tidymodels}
#' see \code{terra::predict} for all input arguments
#'
#' @param object spatRaster object. Typically a multi-layer type
#' @param model  Fitted model from \code{tidymodels}
#' @param ...  additional arguments for predict function
#' @return a raster with prediction
#' @export
#'
#' @examples
#'

spat_mod_pred <- function(object, model, ..., const=NULL, na.rm=TRUE, index = 1,
                          cores=1, cpkgs=NULL, filename="", overwrite=FALSE,
                          wopt=list()){

    fun<- function(...){
        p<- predict(...)
        return(as.matrix(as.numeric(p[, 1, drop=T])))
    }

    terra::predict(object, model, fun=fun, ..., const, na.rm, index,
                   cores, cpkgs, filename, overwrite, wopt)
}
