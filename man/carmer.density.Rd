\name{carmer.density}
\alias{carmer.density}
\docType{data}
\title{
  Maize yield-density model
}
\description{
  Maize yield-density model.
}
\usage{data(carmer.density)}
\format{
  A data frame with 32 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{Hybrid factor, 8 levels}
    \item{\code{pop}}{Population (plants)}
    \item{\code{yield}}{Yield, pounds per hill}
  }
}
\details{
  Eight single-cross hybrids were in the experiment--Hy2xOh7 and WF9xC103 were
  included because it was believed they had optimum yields at relatively
  high and low popultions.  Planted in 1963.  Plots were thinned to
  2, 4, 6, 8 plants per hill, giving densities 8, 16, 24, 32 thousand
  plants per acre.  Hills were in rows 40 inches apart--one hill =
  1/4000 acre.  Split-plot design with 5 reps, density is main plot and
  subplot was hybrid.
}
\source{
  S G Carmer and J A Jackobs (1965).
  An Exponential Model for Predicting Optimum Plant Density and Maximum
  Corn Yield. \emph{Agronomy Journal}, 57, 241--244
}

\examples{
data(carmer.density)

dat <- carmer.density
dat$gen <- factor(dat$gen, levels=c('Hy2x0h7','WF9xC103','R61x187-2',
                             'WF9x38-11','WF9xB14','C103xB14',
                             '0h43xB37','WF9xH60'))
xyplot(yield~pop|gen, dat, pch=16, as.table=TRUE)

# Model: y = x * a * k^x.  Table 1 of Carmer and Jackobs.
out <- data.frame(a=rep(NA,8), k=NA)
rownames(out) <- levels(dat$gen)
for(i in levels(dat$gen)){
  print(i)
  dati <- subset(dat, gen==i)
  mi <- nls(yield ~ pop * a * k^pop, data=dati, start=list(a=10,k=1))
  out[i, ] <- mi$m$getPars()
}
# Optimum plant density is -1/log(k)
out$pop.opt <- -1/log(out$k)
round(out, 3)

}
\keyword{datasets}
