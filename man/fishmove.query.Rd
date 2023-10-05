\name{fishmove.query}
\alias{fishmove.query}


\title{
Prediction of Probabilities of Fish Movement/Occurrence based on Leptokurtic Dispersal Kernels
}

\description{
Function to predict probabilities of fish movement/occurrence based on leptokurtic dispersal kernels fitted via multiple regression.
}

\usage{
fishmove.query(fishmove,p=0.67,dist=NA,fromto=NA,prob=NA,reach=NA,w=1,level="fit",...)
}

\arguments{
  \item{fishmove}{
	Output object (predicted dispersal kernel) from \code{fishmove}. If \code{fishmove}-kernel is predicted for multiple values e.g. of stream order, only first values are used for subsequent query.
	}
  \item{p}{
    Share of stationary component on the population (0-1). The default value for \code{p} is 0.67.
	}
  \item{dist}{
	Optional argument for distance (distance from source) where the user wants to know the kernel probability (height of the dispersal density kernel)
	}
  \item{fromto}{
	  Optional argument for a segment (defined by from distance - to distance) where the user wants to know the cumulative kernel probability (Integral: area under dispersal density kernel between from and to.)
	}
  \item{prob}{
	Optional argument: Reverse argument of distance/from to. Probability is provided and distance from source is calculated. Argument used in combination with \code{reachlength}.
	}
  \item{reach}{
	Optional argument: Length of receiving reach. Argument used in combination with \code{prob}. 
	}
  \item{w}{
	Optional argument: Weighting factor for the dispersal kernel e.g. weight by source population size. When weight is use area under dispersal kernel (and thus the overall cumulative probability) equals the weigthing factor. The default value for \code{weight} is 1.
	}
  \item{level}{
	If statistical interval is calculated with \code{fishmove}, level defines if upper ("upr") or lower ("lwr") level of the calculted interval is used. The default value for \code{level} is "fit".
	}
  \item{\dots}{
	do not use.
	}
}

\details{
	\code{fishmove.query} allows querying the dispersal kernel (predicted from \code{fishmove}) for several questions e.g.: 

  (i) what is the probability of occurence in a distance x (\code{distance}) from the source population
  
  (ii) what is the cumulative probability of occurence in a target reach between from/to distance (\code{fromto}) from the source population. (Integral: area under dispersal density kernel between from and to)
  
  (iii) where (distance, with a given reach length) is a certain probability (\code{prob}) of occurence on the dispersal kernel. So output here is a distance.
  
  
  The movement parameters are calculated by \code{fishmove} for a stationary (\eqn{\sigma_{stat}}{sigma_stat}) and for a mobile component (\eqn{\sigma_{mob}}{sigma_mob}) of a fish population. 
  
  The queried probabilities and distances depend on the parameters defined during the prediction of \code{fishmove} e.g. fishlength, aspect ratio, stream order etc. as well as on the share of the stationary component (\code{p}) the kernel weighting factor (\code{weight}) and the level (\code{level}).
	
}

\value{
		\item{out}{distance (in m) or probability depending on the input}
}

\author{
	Johannes Radinger
}

\references{
	Radinger, J. and Wolter C. (2014) 
	Patterns and predictors of fish dispersal in rivers. \emph{Fish and Fisheries}. 15:456-473. DOI: http://dx.doi.org/10.1111/faf.12028.
}

\seealso{
  \code{\link{fishmove}}, \code{\link{pdk}}
}

\examples{
	# Prediction for a selected fish species
	fm <- fishmove(L=100, AR=1.5, T=365, rep=20)
  
  # Query using fishmove.query
  
  # at which distance is the cumulative probability (area under kernel) of a 50 m reach 0.06
  # fishmove.query(fm,prob=0.06,reachlength=50)
  # what is the probability of occurence in a reach between 0 and 50 m from the source population
  fishmove.query(fm,from=0,to=50)


}