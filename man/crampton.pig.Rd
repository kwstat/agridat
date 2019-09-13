\name{crampton.pig}
\alias{crampton.pig}
\docType{data}
\title{
  Weight gain in pigs for different treatments
}
\description{
  Weight gain in pigs for different treatments, with initial weight and
  feed eaten as covariates.
}
\usage{data("crampton.pig")}
\format{
  A data frame with 50 observations on the following 5 variables.
  \describe{
    \item{\code{treatment}}{feed treatment}
    \item{\code{rep}}{replicate}
    \item{\code{weight1}}{initial weight}
    \item{\code{feed}}{feed eaten}
    \item{\code{weight2}}{final weight}
  }
}
\details{
  
  A study of the effect of initial weight and feed eaten on the weight
  gaining ability of pigs with different feed treatments.

  The data are extracted from Ostle. It is not clear that 'replicate' is
  actually a blocking replicate as opposed to a repeated measurement.
  The original source document needs to be consulted.
  
}
\source{
  Crampton, EW and Hopkins, JW. (1934).
  The Use of the Method of Partial Regression in the Analysis of Comparative Feeding Trial Data, Part II.
  \emph{The Journal of Nutrition}, 8, 113-123.
}
\references{
  Bernard Ostle. \emph{Statistics in Research}

  Goulen. \emph{Methods of Statistical Analysis, 1st ed}. Page 256-259.
}
\examples{

library(agridat)

data(crampton.pig)
dat <- crampton.pig

dat <- transform(dat, gain=weight2-weight1)
libs(lattice)
# Trt 4 looks best
xyplot(gain ~ feed, dat, group=treatment, type=c('p','r'),
       auto.key=list(columns=5),
       xlab="Feed eaten", ylab="Weight gain", main="crampton.pig")

# Basic Anova without covariates
m1 <- lm(weight2 ~ treatment + rep, data=dat)
anova(m1)
# Add covariates
m2 <- lm(weight2 ~ treatment + rep + weight1 + feed, data=dat)
anova(m2)
# Remove treatment, test this nested model for significant treatments
m3 <- lm(weight2 ~ rep + weight1 + feed, data=dat)
anova(m2,m3) # p-value .07. F=2.34 matches Ostle

}
\keyword{datasets}
