\name{pdk}
\alias{pdk}
\title{
	Plotting Probability Dispersal Kernel (pdk) of Fish Movement
}
\description{
	Plotting probability dispersal Kernel (pdk) of fish movement based on multiple regression
}

\usage{
	pdk(fishmove, p = 0.67,...)
}

\arguments{
  \item{fishmove}{
	Output from \code{fishmove}, containing the movement parameters \eqn{\sigma_{stat}}{sigma_stat} and \eqn{\sigma_{mob}}{sigma_mob}.
	}
  \item{p}{
	Share of stationary component on the population (0-1). The default value for \code{p} is 0.67.
	}
	\item{\dots}{do not use.
	}
}

\details{
	\code{pdk} provides graphs (based on \href{http://had.co.nz/ggplot2/}{ggplot2}) displaying probability density kernels (pdk) for leptokurtic fish dispersal. For each plot the fitted mean as well as the upper and the lower bound (based on confidence or prediction interval, see \code{\link[stats]{predict.lm}}) are displayed.

	\code{p} is the share of the stationary component in the population resp. 1-\code{p} is the share of the mobile component. An average value for \code{p} is 0.66 (66\% stationary) \cite{(Radinger and Wolter, 2013)}.

	The underlying leptokurtic density function is:

	\deqn{
	F(x)=p*\frac{1}{\sqrt{2\pi\sigma_{stat}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{stat}^2}}+(1-p)*\frac{1}{\sqrt{2\pi\sigma_{mob}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{mob}^2}}}{F(x) = p * (1/(2*pi*sigma_stat^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_stat^2)) + (1-p) * (1/(2*pi*sigma_mob^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_mob^2))}
}

\author{
	Johannes Radinger
}

\references{
Radinger, J. and Wolter C. (2014) 
Patterns and predictors of fish dispersal in rivers. \emph{Fish and Fisheries}. 15:456-473. DOI: http://dx.doi.org/10.1111/faf.12028.
}

\seealso{
	\code{\link{fishmove}}, \code{\link[stats]{lm}}, \code{\link[stats]{predict.lm}}, \code{\link[ggplot2]{ggplot}}
}

\examples{
	# Plotting dispersal kernel for selected fish species with time=365 days
	pdk(fishmove(species="Salmo trutta fario",T=365))
}
