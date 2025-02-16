% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/r_predict.R
\name{spat_mod_pred}
\alias{spat_mod_pred}
\title{Spatial model predictions}
\usage{
spat_mod_pred(
  object,
  model,
  ...,
  const = NULL,
  na.rm = TRUE,
  index = 1,
  cores = 1,
  cpkgs = NULL,
  filename = "",
  overwrite = FALSE,
  wopt = list()
)
}
\arguments{
\item{object}{spatRaster object. Typically a multi-layer type}

\item{model}{Fitted model from \code{tidymodels}}

\item{...}{additional arguments for predict function}
}
\value{
a raster with prediction
}
\description{
A wrapper around \code{terra::predict} for models build using \code{tidymodels}
see \code{terra::predict} for all input arguments
}
