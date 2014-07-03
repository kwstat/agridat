\name{piepho.cooksfoot}
\alias{piepho.cooksfoot}
\docType{data}
\title{
  Heading dates for cook's foot on 25 varieties in 7 years
}
\description{
  Heading dates for cook's foot on 25 varieties in 7 years
}
\usage{data(piepho.cooksfoot)}
\format{
  A data frame with 111 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype factor, 25 levels}
    \item{\code{year}}{year, numeric}
    \item{\code{date}}{heading date (days from April 1)}
  }
}
\details{
   These data are heading dates (days from April 1 to heading) of  25 cook's foot
  \emph{Dactylis glomerata} varieties in trials at Hannover, Germany,
  repeated over seven years.  Values are means over replications.
}
\source{
  Hans-Pieter Piepho. (1999).
  Fitting a Regression Model for Genotype-by-Environment Data on Heading
  Dates in Grasses by Methods for Nonlinear Mixed Models.
  \emph{Biometrics}, 55, 1120-1128.
}
\examples{

dat <- piepho.cooksfoot
dat$env <- factor(dat$year)

densityplot(~date|env, data=dat, main="piepho.cooksfoot - heading date") # Gaussian, not gamma distn

if(require(lme4)){
  # A simple mixed model gives results similar to Piepho, Table 2.
  m1 <- lmer(date ~ -1 + gen + (1|env), data=dat)
  summary(m1)
  ## Fixed effects:
  ##        Estimate Std. Error t value
  ## genG01   48.951      1.744   28.07
  ## genG02   42.270      1.755   24.09
  ## genG03   45.293      1.744   25.98
  ## genG04   45.467      1.744   26.08
  ## genG05   44.215      1.755   25.20
}

}
\keyword{datasets}
