\name{cordoba.corn}
\alias{cordoba.corn}
\docType{data}
\title{
  Yield monitor data for an on-farm strip trial of phosphorus in corn
}
\description{
  Yield monitor data for an unreplicated on-farm strip trial of corn in
  Argentina, with one strip fertilized with phosphorus and one control strip.
}
\usage{data("cordoba.corn")}
\format{
  A data frame with 3070 observations on the following 4 variables.
  \describe{
    \item{\code{x}}{x coordinate (easting), meters}
    \item{\code{y}}{y coordinate (northing), meters}
    \item{\code{trt}}{treatment, \code{Control} or \code{Fertilized}}
    \item{\code{yield}}{grain yield, t/ha}
  }
}
\details{
  An on-farm experiment in a rainfed corn field in Córdoba, central
  Argentina. The source calls it field F2.

  The effect of broadcast phosphorus fertilization was evaluated with two
  strips. The fertilized strip received superphosphate (0-21-0) at rates
  from 250 to 500 kg/ha. The control strip received no phosphorus
  fertilizer. Each strip was 2.2 ha. The source also mentions a total
  area of 100 ha.

  There is one strip per treatment, so the treatments are not replicated.
  Each strip was harvested in several combine passes. The data are
  yield monitor points, 1499 in the control strip and 1571 in the
  fertilized strip. The authors cleaned the raw yield monitor data with
  the protocol of Vega et al. (2019). Consecutive points are about 1.8 m
  apart.

  The coordinates are UTM zone 20S (EPSG:32720). Coordinates, yield and
  the order of the rows are the same as in the source data.

  In the ofemeantest package, yield was converted from kg/ha to t/ha
  and records with a yield of 9.8 t/ha or more were removed.

  Neither the package nor the CONICET record gives the year of the
  trial. The raw file in the ofemeantest repository is named
  F2_BD_P_2020.gpkg.

  The ofemeantest package has an MIT license. The CONICET record has the
  license CC BY-NC-SA 2.5 AR, lists the ofemeantest repository as derived
  from it, and does not include a data file for field F2.
}
\source{
  Córdoba, M., Paccioretti, P. and Balzarini, M. (2026).
  ofemeantest: On Farm Experimentation Mean Test.
  R package version 1.0.0. Dataset \code{ofe_f2}.
  https://CRAN.R-project.org/package=ofemeantest

  Córdoba, M., Paccioretti, P. and Balzarini, M. (2024).
  On-Farm single strip treatment trials.
  Consejo Nacional de Investigaciones Científicas y Técnicas. (dataset).
  http://hdl.handle.net/11336/236743
}
\references{
  Córdoba, M., Paccioretti, P. and Balzarini, M. (2025).
  A new method to compare treatments in unreplicated on-farm experimentation.
  Precision Agriculture, 26, 4.
  https://doi.org/10.1007/s11119-024-10206-0

  Vega, A., Córdoba, M., Castro-Franco, M. and Balzarini, M. (2019).
  Protocol for automating error removal from yield maps.
  Precision Agriculture, 20, 1030-1044.
  https://doi.org/10.1007/s11119-018-09632-8
}
\examples{
\dontrun{

library(agridat)
data(cordoba.corn)
dat <- cordoba.corn

# Layout of the two strips
libs(lattice)
xyplot(y ~ x, data=dat, groups=trt, aspect="iso", pch=16, cex=.4,
       auto.key=list(columns=2),
       main="cordoba.corn layout")

# Yield map
libs(ggplot2)
ggplot(dat, aes(x=x, y=y, color=yield)) +
  geom_point(size=.6) +
  scale_color_viridis_c() +
  coord_equal() +
  labs(title="cordoba.corn yield")

# Treatment means
aggregate(yield ~ trt, data=dat, FUN=mean)
##          trt    yield
## 1    Control 4.808147
## 2 Fertilized 5.312872

# A t-test that treats the 3070 points as independent observations.
# Neighboring points are spatially correlated, so this standard error
# is too small. More basically, there is only one strip per treatment,
# so the treatment effect is confounded with the location of the strip.
t.test(yield ~ trt, data=dat)

# OFE-mean test of Cordoba et al. (2025). The points are summarized by
# their median in 10 m grid cells, the effective sample size (ESS) of the
# cells is estimated from the spatial correlation, and permutation tests
# are run on repeated subsamples of that size. The test accounts for the
# spatial correlation within the strips. It tests whether the two strips
# differ. Attributing the difference to phosphorus assumes that the two
# strips would yield alike without it.
libs(sf, ofemeantest)
dsf <- st_as_sf(dat, coords=c("x","y"), crs=32720)
m1 <- ofemt(dsf, y="yield", x="trt")
m1
## n: 468 | ESS: 89 | Rho: 0.630 | Moran's I: 0.577
##         trt yield_mean letters
##  Fertilized   5.329230      a
##     Control   4.766786       b
##              Comparison p_value p_adj
##  Fertilized vs. Control   0.013 0.013
# yield_mean is the median of the cell medians, and p_value is the
# median p-value over the subsamples.

}
}
\keyword{datasets}
