\name{devries.pine}
\alias{devries.pine}
\docType{data}
\title{
  Graeco-Latin Square experiment in pine
}
\description{
  Graeco-Latin Square experiment in pine
}
\usage{data("devries.pine")}
\format{
  A data frame with 36 observations on the following 6 variables.
  \describe{
    \item{\code{block}}{block}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{spacing}}{spacing treatment}
    \item{\code{thinning}}{thinning treatment}
    \item{\code{volume}}{stem volume in m^3/ha}
    \item{\code{growth}}{annual stem volume increment m^3/ha at age 11}
  }
}
\details{
  Experiment conducted on Caribbean Pine at Coebiti in Surinam (Long 55
  28 30 W, Lat 5 18 5 N). Land was cleared in Jan 1965 and planted May
  1965. Each experimental plot was 60m x 60m. Roads 10 m wide run
  between the rows. Each block is thus 180m wide and 200m deep. Data
  were collected only on 40m x 40m plots in the center of each
  experimental unit. Plots were thinned in 1972 and 1975.  
  The two treatment factors (spacing, thinning) were assigned in a
  Graeco-Latin Square design.
  
  Spacing: A=2.5, B=3, C=3.5. Thinning: Z=low, M=medium, S=heavy.

  Field width: 4 blocks x 180 m = 720 m
  
  Field length: 1 block x 200 m = 200 m.

}
\source{
  P.G. De Vries, J.W. Hildebrand, N.R. De Graaf. (1978).
  Analysis of 11 years growth of carribbean pine in a replicated
  Graeco-Latin square spacing-thinning experiment in Surinam. Page 46, 51.
  https://edepot.wur.nl/287590
}
\references{
  None
}
\examples{
\dontrun{

  library(agridat)
  data(devries.pine)
  dat <- devries.pine

  libs(desplot)
  desplot(dat, volume ~ col*row,
          main="devries.pine - expt design and tree volume",
          col=spacing, num=thinning, cex=1, out1=block, aspect=200/720)
  
  libs(HH)
  HH::interaction2wt(volume ~ spacing+thinning, dat,
                     main="devries.pine")

  # ANOVA matches appendix 5 of DeVries
  m1 <- aov(volume ~ block + spacing + thinning + block:factor(row) +
              block:factor(col), data=dat)
  anova(m1)

}
}
\keyword{datasets}
