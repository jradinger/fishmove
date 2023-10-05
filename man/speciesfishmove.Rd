\name{speciesfishmove}
\alias{speciesfishmove}
\docType{data}
\title{
	Morphological Data for various Fish Species
}

\description{
	Data of length and aspect ratio of the caudal fin \cite{(Pauly, 1989)} for various fish species (appr. 40 species). Accompanying dataset for function \code{fishmove} originating from fishbase.org \cite{(Froese and Pauly, 2011)}.
}

\usage{speciesfishmove}
	\format{
  	This dataframe contains following columns:
  	\describe{
   		\item{FAMILY}{scientific name of fish family}
    	\item{SPECIES}{scientific name of fish species}
		\item{LENGTH}{common fish length in mm}
    	\item{ASPECT.RATIO}{aspect ratio of the caudal fin \cite{(Pauly, 1989)}}  
  }
}

\author{
	Johannes Radinger
}

\source{
	Froese, R. and Pauly D. (2011)
	\emph{FishBase.} World Wide Web electronic publication. \href{www.fishbase.org}{www.fishbase.org}, version (12/2011).
}

\references{
	Pauly, D. (1989)
	A simple index of metabolic level in fishes. \emph{Fishbyte, Newsletter of the Network of Tropical Fisheries Scientists} 7, 22.
}