\name{fishmove.estimate}
\alias{fishmove.estimate}


\title{
Estimation of fish movement parameters (\eqn{\sigma_{stat}}{sigma_stat}, \eqn{\sigma_{mob}}{sigma_mob} and \eqn{p}{p}) from field data
}

\description{
Function to estimate the three fish movement parameters \eqn{\sigma_{stat}}{sigma_stat}, \eqn{\sigma_{mob}}{sigma_mob} and \eqn{p}{p} describing the leptokurtic shape of fish dispersal kernels from field data.}

\usage{
fishmove.estimate(data=NA,start=NA,ci=FALSE,rep=100,conf=0.95,...)
}

\arguments{
  \item{data}{
  Single numeric vector of movement distances (field measurements) which should be used to estimate movement parameters. Here, only absolute movement distances are considered and differences in up- or downstream movement are ignored (symmetrical dispersal kernel assumed).}
  \item{start}{
  Named list of starting values used for the internal optimization process. If nothing is provided the 10\% and 90\% quantile of the input data are used as starting values for \eqn{\sigma_{stat}}{sigma_stat} and \eqn{\sigma_{mob}}{sigma_mob} and 0.67 is used as the starting value for \eqn{p}{p}.
	}
  \item{ci}{
  Logical. If true confidence intervals (method=bca) are calculated. This feature is under current development and still unstable. The default value for \code{ci} is FALSE.
  }
  \item{rep}{
  Number of bootstrap replicates to calculate the confidence interval of the obtained parameters. The default value for \code{rep} is 100.
  }
    \item{conf}{
Confidence interval used for parameter estimates. The default value for \code{conf} is 0.95.
  }
  \item{\dots}{
	do not use.
	}
}

\details{
	\code{fishmove.estimate} estimates the three fish movement parameters \eqn{\sigma_{stat}}{sigma_stat}, \eqn{\sigma_{mob}}{sigma_mob} and \eqn{p}{p} describing the leptokurtic shape of fish dispersal kernels from field data.  Here, a symmetrical dispersal kernel is assumed and only absolute movement distances are considered and differences in up- or downstream movement are ignored. The parameters are obtained by optimizing a double normal distribution with  \eqn{\sigma_{stat}}{sigma_stat} as dispersion (standard deviation) parameter for the first distribution,  \eqn{\sigma_{mob}}{sigma_mob} as dispersion (standard deviation) parameter for the second distribution, and  \eqn{p}{p} the weighing factor for the distributions (share of the stationary component):
  
    \deqn{F(x)=p*\frac{1}{\sqrt{2\pi\sigma_{stat}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{stat}^2}}+(1-p)*\frac{1}{\sqrt{2\pi\sigma_{mob}^2}}*e^{-\frac{(x-\mu)^2}{2\sigma_{mob}^2}}}{F(x) = p * (1/(2*pi*sigma_stat^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_stat^2)) + (1-p) * (1/(2*pi*sigma_mob^2)^(1/2))*e^(-(x-mu)^2/(2*pi*sigma_mob^2))}
    
  The optimization is based on a maximum likelihood approach ("L-BFGS-B") using the underlying fitdistr() and optim() functions.
  
  Under development: Based on non-parametric bootstrapping approach the 95\%-confidence interval (method="bca") is calculated for the three extracted parameters. The default number of bootstrap replicates (\code{rep}) is set to 100.

}

\value{
		\item{out}{If no confidence intervals are calculated (default), the return object is of class "fitdistr". The three estimated movement parameters \eqn{\sigma_{stat}}{sigma_stat} (movement parameter of stationary component), \eqn{\sigma_{mob}}{sigma_mob} (movement parameter of mobile component) and \eqn{p}{p} (share of the stationary component) and their corresponding standard errors are provided.
    If bootstrapped confidence interval are calculated the fit, the lower and the upper bound of \eqn{\sigma_{stat}}{sigma_stat},  \eqn{\sigma_{mob}}{sigma_mob} and \eqn{p}{p} are provided.}
}

\author{
	Johannes Radinger
}

\references{
	Radinger, J. and Wolter C. (2014) 
	Patterns and predictors of fish dispersal in rivers. \emph{Fish and Fisheries}. 15:456-473. DOI: http://dx.doi.org/10.1111/faf.12028.
}

\seealso{
  \code{\link{fishmove}}, \code{\link{pdk}}, \code{\link{fitdistr}}}

\examples{
	# Fictive fish movement data e.g. from a telemetry study (displacement distances)
  set.seed(42)
  fielddata <- c(rnorm(mean=0,sd=50,300),rnorm(mean=0,sd=700,200))  
  
  # extracting parameters using \code{fishmove.estimate}
  parameters <- fishmove.estimate(fielddata)
  parameters

  # Plot
  hist(fielddata,breaks=30,freq=FALSE)


  # Definition of probability density function based on two superimposed normal distributions
  # ddoublenorm <- function(x,sigma_stat,sigma_mob,p){
  #		dnorm(x,mean=0,sd=sigma_stat)*p+
  #		dnorm(x,mean=0,sd=sigma_mob)*(1-p)}

  #x <- seq(min(fielddata),max(fielddata),length.out=1000)


  #lines(x,
  #		ddoublenorm(x,
  #			parameters$estimate["sigma_stat"],
  #			parameters$estimate["sigma_mob"],
  #			parameters$estimate["p"]),
  #		col="red")

}