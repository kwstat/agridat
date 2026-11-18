\name{buntaran.wheat}
\alias{buntaran.wheat}
\docType{data}
\title{
Multi-environment trial of wheat in Sweden in 2016.
}
\description{
Multi-environment trial of wheat in Sweden in 2016.
}
\usage{data("buntaran.wheat")}
\format{
  A data frame with 1069 observations on the following 6 variables.
  \describe{
    \item{\code{zone}}{Geographic zone: south, middle, north}
    \item{\code{loc}}{Location}
    \item{\code{rep}}{Block replicate (2 per location)}
    \item{\code{alpha}}{Incomplete-block in the alpha design}
    \item{\code{gen}}{Genotype (cultivar)}
    \item{\code{yield}}{Dry matter yield, g/m^2}
  }
}
\details{
  Dry matter yield from winter wheat trials in Sweden in 2016. The
  experiments in each location were alpha designs with two replicates.

  Yield is in g/m^2 (100 g/m^2 = 1 t/ha), as in Buntaran et al. (2020),
  Tables 3 and 9, and Buntaran et al. (2021), Table 9 (MSEP in
  g^2 m^-4). The column heading "g/ha" in Table 10 of Buntaran et al.
  (2021) is a typo for g/m^2.

  Electronic data are from the online supplement of Buntaran et al.
  (2020), file "Winter Wheat 2016.csv" (the 43 rows without yield are
  omitted here), and also from the "inti" package at
  https://github.com/Flavjack/inti.

  Buntaran et al. (2021) used 25 of the 30 cultivars from the same
  trials, plus soil covariates. The 891 rows with yield in their
  supplement file "Swedish_data_covar_asreml.csv" are identical to the
  corresponding rows here.
}
\source{
  Buntaran, Harimurti et al. (2020).
  Cross-validation of stagewise mixed-model analysis of Swedish variety trials with winter wheat and spring barley.
  Crop Science, 60, 2221-2240.
  https://doi.org/10.1002/csc2.20177
}
\references{
  Buntaran, Harimurti; Forkman, Johannes; Piepho, Hans-Peter (2021).
  Projecting results of zoned multi-environment trials to new locations
  using environmental covariates with random coefficient models:
  accuracy and precision.
  Theoretical and Applied Genetics, 134, 1513-1530.
  https://doi.org/10.1007/s00122-021-03786-2
}
\examples{
\dontrun{
data(buntaran.wheat)
library(agridat)
dat <- buntaran.wheat
library(lattice)
bwplot(yield~loc|zone, dat, layout=c(1,3),
       scales=list(x=list(rot=90)),
       main="buntaran.wheat")
}
}
\keyword{datasets}
