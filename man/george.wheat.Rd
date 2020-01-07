\name{george.wheat}
\alias{george.wheat}
\docType{data}
\title{
  Multi-location/year breeding trial in California
}
\description{
  Multi-location/year breeding trial in California
}
\usage{data("george.wheat")}
\format{
  A data frame with 13996 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{genotype number}
    \item{\code{year}}{year}
    \item{\code{location}}{location}
    \item{\code{block}}{block}
    \item{\code{yield}}{yield per plot}
  }
}
\details{
  This is a nice example of data from a breeding trial, in which some
  check genotypes are kepts during the whole experiment, while other
  genotypes enter and leave the breeding program.  The data is highly
  unbalanced with respect to genotypes-by-environments.
  
  Results of late-stage small-trials of 211 genotypes of wheat in
  California, conducted at 9 locations during the years 2004-2018.
  
  Each trial was an RCB with 4 blocks.

  The authors used this data to look at GGE biplots across years and
  concluded that repeatable genotype-by-location patterns were weak, and
  therefore the California cereal production region is a large,
  unstable, mega-environment.

  Data downloaded 2019-10-29 from Dryad,
  https://doi.org/10.5061/dryad.bf8rt6b. 
  Data are public domain.  
}
\source{
  Nicholas George and Mark Lundy (2019).
  Quantifying Genotype x Environment Effects in Long-Term Common Wheat Yield Trials from an Agroecologically Diverse Production Region.
  Crop Science, 59, 1960-1972.
  http://doi.org/10.2135/cropsci2019.01.0010
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  libs(lattice, reshape2)
  data(george.wheat)
  dat <- george.wheat
  
  dat$env <- paste0(dat$year, ".", dat$location)
  # average reps, cast to matrix
  mat <- reshape2::acast(dat, gen ~ env, value.var="yield", fun=mean, na.rm=TRUE)
  lattice::levelplot(mat, aspect="m", 
                     main="george.wheat", xlab="genotype", ylab="environment",
                     scales=list(x=list(cex=.3,rot=90),y=list(cex=.5)))

}
}
\keyword{datasets}
