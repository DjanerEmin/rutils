% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/path_create.R
\name{path_create}
\alias{path_create}
\title{Create a folder}
\usage{
path_create(folder, path = ".")
}
\arguments{
\item{folder}{folders to create}

\item{path}{parent path}
}
\description{
Wrapper around \code{fs::dir_create(path(path, folder))}
}
