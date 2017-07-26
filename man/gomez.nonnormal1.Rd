\name{gomez.nonnormal1}
\alias{gomez.nonnormal1}
\docType{data}
\title{
  Insecticide treatment effectiveness
}
\description{
  Insecticide treatment effectiveness
}
\usage{data("gomez.nonnormal1")}
\format{
  A data frame with 36 observations on the following 3 variables.
  \describe{
    \item{\code{trt}}{insecticidal treatment}
    \item{\code{rep}}{replicate}
    \item{\code{larvae}}{number of larvae}
  }
}
\details{
  
  Nine treatments (including the control, T9) were used on four
  replicates.  The number of living insect larvae were recorded.

  The data show signs of non-normality, and a log transform was used by Gomez.
  
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 300.

  Used with permission of Kwanchai Gomez.
}
\references{
  None.
}
\examples{
data(gomez.nonnormal1)
dat <- gomez.nonnormal1

# Gomez figure 7.3
## require(dplyr)
## dat2 <- dat %>% group_by(trt)
## dat2 <- summarize(dat2, mn=mean(larvae), rng=diff(range(larvae)))
## plot(rng ~ mn, data=dat2,
##      xlab="mean number of larvae", ylab="range of number of larvae",
##      main="gomez.nonnormal1")


# Because some of the original values are less than 10,
# the transform used is log10(x+1) instead of log10(x).
dat <- transform(dat, tlarvae=log10(larvae+1))

# QQ plots for raw/transformed data
if(require(reshape2) & require(lattice))
  qqmath( ~ value|variable, data=melt(dat),
         main="gomez.nonnormal1 - raw/transformed QQ plot",
         scales=list(relation="free"))

# Gomez table 7.16
m1 <- lm(tlarvae ~ rep + trt, data=dat)
anova(m1)
## Response: tlarvae
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        3 0.9567 0.31889  3.6511 0.0267223 *  
## trt        8 3.9823 0.49779  5.6995 0.0004092 ***
## Residuals 24 2.0961 0.08734

}
\keyword{datasets}
