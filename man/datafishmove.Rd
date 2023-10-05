\name{datafishmove}
\alias{datafishmove}
\docType{data}
\title{Basic Data for \code{fishmove}}
\description{
Data for performing multiple regression to calculate movement parameters of leptokurtic fish dispersal. Underlying dataset for function \code{fishmove}.
}
\usage{datafishmove}
\format{
  This dataframe contains following columns:
  \describe{
    \item{FAMILY}{scientific name of fish family}
    \item{SPECIES}{scientific name of fish species}
    \item{STREAM.ORDER}{stream order \cite{(Strahler, 1957)}}
    \item{LENGTH}{fish length in mm}
    \item{ASPECT.RATIO}{aspect ratio of the caudal fin \cite{(Pauly, 1989)}}
    \item{TIME}{Time of study}
    \item{SIGMA_STAT}{movement parameter of stationary component}
    \item{SIGMA_MOB}{movement parameter of mobile component}
    \item{p}{share of stationary component}
    \item{REP}{indication of replicates}
  }
}
\author{
Johannes Radinger
}
\source{
Radinger, J. and Wolter C. (2014) 
Patterns and predictors of fish dispersal in rivers. \emph{Fish and Fisheries}. 15:456-473. DOI: http://dx.doi.org/10.1111/faf.12028.
}
\references{
Pauly, D. (1989)
A simple index of metabolic level in fishes. \emph{Fishbyte, Newsletter of the Network of Tropical Fisheries Scientists} 7, 22.

Strahler, A.N. (1957) 
Quantitative analysis of watershed geomorphology. 
\emph{Transactions of the American Geophysical Union} 8, 913-920.
}
