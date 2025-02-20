% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/s2_detect_level.R
\name{s2_detect_level}
\alias{s2_detect_level}
\title{Detect Processing level of Sentinel-2 file}
\usage{
s2_detect_level(path, assume = "l2a", capitalize = FALSE)
}
\arguments{
\item{path}{the full path to Sentinel-2 file}

\item{assume}{string to return if no match found}

\item{capitalize}{whether to return the level as capital letters. Default to \code{FALSE}}
}
\value{
String One of \code{"l1c", "l2a"}
}
\description{
Detect Processing level of Sentinel-2 file
}
\examples{

path <- "S2A_MSIL2A_20190120T103341_N0211_R108_T32UNB_20190120T131644.SAFE"

s2_detect_level(path)

}
