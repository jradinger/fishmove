\name{fishmove}
\alias{fishmove}
\alias{print.fishmove}
\alias{summary.fishmove}

\title{
Prediction of Fish Movement Parameters based on Multiple Regression
}

\description{
Functions to predict fish movement parameters of leptokurtic fish dispersal, based on multiple regression.
}

\usage{
fishmove(species=NA,L=NA,AR=NA,SO=6,T=30,interval="confidence",rep=50,seed=NA,...)
}

\arguments{
  \item{species}{
	Fish species (scientific name) from \code{speciesfishmove}, used for prediction of movement parameters. If \code{species} is set, then values for length and the aspect ratio are taken from \code{speciesfishmove} and must not be provided by the user. Any additional argument on fish length and/or aspect ratio overwrites these settings. \code{speciesfishmove} originates in fishbase.org \cite{(Froese and Pauly, 2011)}. 
	}
  \item{L}{
	Fish length (mm), used for prediction of movement parameters. Also a vector of several fish lengths can be provided.
	}
  \item{AR}{
	Aspect ratio of the caudal fin, used for prediction of movement parameters \cite{(Pauly, 1989)}. A vector of several aspect ratios can be provided.
	}
  \item{SO}{
	Stream order \cite{(Strahler, 1957)}, used for prediction of movement parameters. The default value for \code{SO} is 6. A vector of several stream orders can be provided.
	}
  \item{T}{
	Time step (days), used for prediction of movement parameters. The default value for \code{new.time} is 30 (days). A vector of several times can be provided.
	}
  \item{interval}{
	Type of interval calculation. Can be either "confidence" or "prediction". The default for \code{interval} is "confidence". See \code{\link[stats]{predict.lm}}.
	}
  \item{rep}{
	Number of regression runs to correct for replicates in \code{datafishmove}. The default value for \code{rep} is 50.
	}
  \item{seed}{
	Number (integer) specifying a fixed seed for the random subsampling process (replicates of regression runs). By default this value is set random.
	}
  \item{\dots}{
	do not use.
	}
}

\details{
	\code{fishmove} predicts movement parameters of leptokurtic fish dispersal. The prediction is based on multiple regression on four variables (fish length, aspect ratio of the caudal fin \cite{(Pauly, 1989)}, stream order \cite{(Strahler, 1957)} and time).

	The package 'fishmove' is based on a meta-analyis of heterogeneous fish movement in rivers \cite{(see Radinger and Wolter, 2013)}

	The movement parameters are calculated for a stationary (\eqn{\sigma_{stat}}{sigma_stat}) and for a mobile component (\eqn{\sigma_{mob}}{sigma_mob}) of a fish population. These parameters in combination with a value for the share of each component can be used to describe and display leptokurtic dispersal kernels according to:

	\deqn{F(x)=p*\frac{1}{\sqrt{2\pi\sigma_{stat}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{stat}^2}}+(1-p)*\frac{1}{\sqrt{2\pi\sigma_{mob}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{mob}^2}}}{F(x) = p * (1/(2*pi*sigma_stat^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_stat^2)) + (1-p) * (1/(2*pi*sigma_mob^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_mob^2))}

	New values are calculated for a fitted mean and its upper and lower bound (confidence or prediction interval) based on a set of new input variables. In addition, common fish length and aspect ratio, are already provided for appr. 40 different species from fishbase.org \cite{(Froese and Pauly, 2011)}.
}

\value{
		\item{coef.fishmove}{Array of regression parameters of the original multiple regression}

		\item{pred.fishmove}{predicted value, upper and lower bound for \eqn{\sigma_{stat}}{sigma_stat} (movement parameter of stationary component) and \eqn{\sigma_{mob}}{sigma_mob} (movement parameter of mobile component)}
}

\author{
	Johannes Radinger
}

\references{
	Froese, R. and Pauly D. (2011)
	\emph{FishBase.} World Wide Web electronic publication. \href{www.fishbase.org}{www.fishbase.org}, version (12/2011).

	Pauly, D. (1989)
	A simple index of metabolic level in fishes. \emph{Fishbyte, Newsletter of the Network of Tropical Fisheries Scientists} 7, 22.

	Radinger, J. and Wolter C. (2014) 
	Patterns and predictors of fish dispersal in rivers. \emph{Fish and Fisheries}. 15:456-473. DOI: http://dx.doi.org/10.1111/faf.12028.

	Strahler, A. N. (1957) 
	Quantitative analysis of watershed geomorphology. \emph{Transactions of the American Geophysical Union} 8, 913-920.
}

\seealso{
	\code{\link{pdk}}, \code{\link[stats]{lm}}, \code{\link[stats]{predict.lm}}
}


\examples{
	# Prediction for a selected fish species with time=365 days
	fishmove(species="Salmo trutta fario",T=365)

	# Prediction with fish length=350 mm, aspect ratio=2, stream order=4 and prediction interval
	# fishmove(L=350,AR=2,SO=4,T=365,interval="prediction")
}
