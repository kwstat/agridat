\name{lin.superiority}
\alias{lin.superiority}
\docType{data}
\title{
  Multi-environment trial of 33 barley genotypes in 12 locations
}
\description{
  Multi-environment trial of 33 barley genotypes in 12 locations
}
\usage{data("lin.superiority")}
\format{
  A data frame with 396 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype/cultivar}
    \item{\code{region}}{region}
    \item{\code{loc}}{location}
    \item{\code{yield}}{yield (kg/ha)}
  }
}
\details{
  Yield of six-row barley from the 1983 annual report of Eastern
  Cooperative Test in Canada.

  The named cultivars Bruce, Conquest, Laurier, Leger are checks, while
  the other cultivars were tests.
}
\source{
  C. S. Lin, M. R. Binns (1985).
  Procedural approach for assessing cultivar-location data: Pairwise genotype-environment interactions of test cultivars with checks
  \emph{Canadian Journal of Plant Science}, 1985, 65(4): 1065-1071. Table 1.
  https://doi.org/10.4141/cjps85-136
}

\references{
  C. S. Lin, M. R. Binns (1988).
  A Superiority Measure Of Cultivar Performance For Cultivar x Location Data.
  \emph{Canadian Journal of Plant Science}, 68, 193-198.
  https://doi.org/10.4141/cjps88-018

  Mohammed Ali Hussein, Asmund Bjornstad, and A. H. Aastveit (2000).
  SASG x ESTAB: A SAS Program for Computing Genotype x Environment
  Stability Statistics.
  \emph{Agronomy Journal}, 92; 454-459.
  https://doi.org/10.2134/agronj2000.923454x
}
\examples{
\dontrun{

library(agridat)

data(lin.superiority)
dat <- lin.superiority

libs(latticeExtra)
libs(reshape2)
# calculate the superiority measure of Lin & Binns 1988

dat2 <- acast(dat, gen ~ loc, value.var="yield")
locmean <- apply(dat2, 2, mean)
locmax <- apply(dat2, 2, max)
P <- apply(dat2, 1, function(x) {
  sum((x-locmax)^2)/(2*length(x))
})/1000
P <- sort(P)
round(P) # match Lin & Binns 1988 table 2, column Pi

# atlantic & quebec regions overlap
# libs(gge)
# m1 <- gge(dat, yield ~ gen*loc, env.group=region,
#           main="lin.superiority")
# biplot(m1)

# create a figure similar to Lin & Binns 1988

# add P, locmean, locmax back into the data
dat$locmean <- locmean[match(dat$loc, names(locmean))]
dat$locmax <- locmax[match(dat$loc, names(locmax))]
dat$P <- P[match(dat$gen, names(P))]
dat$gen <- reorder(dat$gen, dat$P)
xyplot(locmax ~ locmean|gen, data=dat,
       type=c('p','r'), as.table=TRUE, col="gray",
       main="lin.superiority - Superiority index",
       xlab="Location Mean",
       ylab="Yield of single cultivars (blue) & Maximum (gray)") +
  xyplot(yield ~ locmean|gen, data=dat,
         type=c('p','r'), as.table=TRUE, pch=19)

}
}
\keyword{datasets}
