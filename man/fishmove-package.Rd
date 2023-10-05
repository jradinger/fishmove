\name{fishmove-package}
\alias{fishmove-package}
\docType{package}
\title{
	Prediction of Fish Movement Parameters based on Multiple Regression
}
\description{
	Functions to predict fish movement parameters based on multiple regression and plotting leptokurtic fish dispersal kernels.

	\tabular{ll}{
	Package: \tab fishmove\cr
	Version: \tab 0.3-3\cr
	Date: \tab 2015-03-23\cr
	Depends: \tab ggplot2, plyr, MASS, boot\cr
	License: \tab GPL (>= 2)\cr
	Depends: \tab ggplot2\cr
	URL: \tab http://dx.doi.org/10.1111/faf.12028 \cr
	}

}

\details{
	The package \pkg{fishmove} consists of two main functions: \code{fishmove} and \code{pdk}:

	\code{fishmove} predicts movement parameters of leptokurtic fish dispersal. The prediction is based on multiple regression on four variables (fish length, aspect ratio of the caudal fin \cite{(Pauly, 1989)}, stream order \cite{(Strahler, 1957)} and time).
	
	The package 'fishmove' is based on a meta-analyis of heterogeneous fish movement in rivers \cite{(see Radinger and Wolter, 2014)}

	The movement parameters are calculated for a stationary (\eqn{\sigma_{stat}}{sigma_stat}) and for a mobile component (\eqn{\sigma_{mob}}{sigma_mob}) of a fish population. These parameters in combination with a value for the share of each component can be used to describe and display leptokurtic dispersal kernels according to:
	\deqn{F(x)=p*\frac{1}{\sqrt{2\pi\sigma_{stat}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{stat}^2}}+(1-p)*\frac{1}{\sqrt{2\pi\sigma_{mob}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{mob}^2}}}{F(x) = p * (1/(2*pi*sigma_stat^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_stat^2)) + (1-p) * (1/(2*pi*sigma_mob^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_mob^2))}

	In addition, common fish length and aspect ratio, are already provided for 40 different species from fishbase.org \cite{(Froese and Pauly, 2011)}.

	The \code{pdk} function provides plots (based on \href{http://had.co.nz/ggplot2/}{ggplot2}) of probability density kernels (pdk) for leptokurtic fish dispersal. For each plot the fitted mean as well as the upper and the lower bound (based on confidence or prediction interval) are displayed.
  
  The \code{fishmove.query} function provides a tool to query a dispersal kernel (predicted by \code{fishmove}) where (distance from source) a certain probability can be found. Also the reverse is possible to query what probability of occurence is found in a certain distance on the dispersal kernel.

	Improvements, bug fixes and constructive criticism are welcome.
}

\author{
	Johannes Radinger

	Maintainer: Johannes Radinger <jradinger@igb-berlin.de>
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

\examples{
	# Prediction for a selected fish species with time=365 days
	trout <- fishmove(species="Salmo trutta fario",T=365)

	# Plot of a leptokurtic dispersal kernel 
	# (density plot for fitted mean, lower and upper limit)
	pdk(trout)
}

\keyword{ package }
