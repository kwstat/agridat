\name{cochran.eelworms}
\alias{cochran.eelworms}
\docType{data}
\title{
  Counts of eelworms before and after fumigant treatments
}
\description{
  Counts of eelworms before and after fumigant treatments
}

\format{
  A data frame with 48 observations on the following 7 variables.
  \describe{
    \item{\code{block}}{block factor, 4 levels}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{fumigant}}{fumigant factor}
    \item{\code{dose}}{dose, Numeric 0,1,2.  Maybe should be a factor?}
    \item{\code{initial}}{count of eelworms pre-treatment}
    \item{\code{final}}{count of eelworms post-treatment}
  }
}
\details{

  In the original experiment plan (as shown in Bailey 2008), columns 9, 10, 11 are
  shifted up slightly.

  Treatment codes: Con = Control, Chl = Chlorodinitrobenzen, Cym =
  Cymag, Car = Carbon Disulphide jelly, See = Seekay.

  Experiment was conducted in 1935 at Rothamsted Experiment Station.  In
  early March 400 grams of soil were sampled and the number of eelworm
  cysts were counted.  Fumigants were added to the soil, oats were sown
  and later harvested.  In October, the plots were again sampled and the
  final count of cysts recorded.
}
\source{
  Cochran and Cox, 1950.
  \emph{Experimental Designs}. Table 3.1.
}
\references{
  R. A. Bailey, 2008. \emph{Design of Comparative Experiments}. Cambridge.
}

\examples{

data(cochran.eelworms)
dat <- cochran.eelworms

# Very strong spatial trends
if(require(desplot)){
  desplot(initial ~ col*row, data=dat,
          flip=TRUE, # aspect unknown
          main="cochran.eelworms")
}


# final counts are strongly related to initial counts
require(lattice)
xyplot(final~initial|factor(dose), data=dat, group=fumigant,
       main="cochran.eelworms - by dose (panel) & fumigant",
       xlab="Initial worm count",
       ylab="Final worm count", auto.key=list(columns=5))

# One approach...log transform, use 'initial' as covariate, create 9 treatments
dat <- transform(dat, trt=factor(paste0(fumigant, dose)))
m1 <- aov(log(final) ~ block + trt + log(initial), data=dat)
anova(m1)
}
\keyword{datasets}
