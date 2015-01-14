\name{patterson.switchback}
\alias{patterson.switchback}
\docType{data}
\title{
  A switchback trial in dairy cattle
}
\description{
  A switchback trial in dairy cattle
}
\usage{data(patterson.switchback)}
\format{
  A data frame with 36 observations on the following 4 variables.
  \describe{
    \item{\code{y}}{response, milk FCM}
    \item{\code{trt}}{treatment factor, 4 levels}
    \item{\code{period}}{period factor, 3 levls}
    \item{\code{cow}}{cow factor, 12 levels}
  }
}
\details{
  None.
}
\source{
  Patterson, HD and Lucas, HL. 1962.
  Change-over designs.
  \emph{Technical Bulletin 147}, North Carolina Agricultural Experimental Station.
}
\references{
  Lowry, S.R. 1989.
  Statistical design and analysis of dairy nutrition experiments to
  improve detection of milk response differences.
  \emph{Proceedings of the Conference on applied statistics in
    agriculture}, 1989.
}

\examples{

data(patterson.switchback)
dat <- patterson.switchback

# Create a numeric period variable
dat$p <- as.numeric(substring(dat$period,2))

# Need to use 'terms' to preserve the order of the model terms
m1 <- aov(terms(y ~ cow + p:cow + period + trt, keep.order=TRUE), data=dat)
anova(m1) # Match table 2 of Lowry
## Analysis of Variance Table
##           Df Sum Sq Mean Sq F value    Pr(>F)
## cow       11 3466.0 315.091 57.1773 2.258e-06 ***
## cow:p     12  953.5  79.455 14.4182 0.0004017 ***
## period     1   19.7  19.740  3.5821 0.0950382 .
## trt        3   58.3  19.418  3.5237 0.0685092 .
## Residuals  8   44.1   5.511

}
\keyword{datasets}
