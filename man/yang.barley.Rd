\name{yang.barley}
\alias{yang.barley}
\docType{data}
\title{
  Yield of 6 barley varieties at 18 locations in Alberta.
}
\description{
  Yield of 6 barley varieties at 18 locations in Alberta.
}
\usage{data(yang.barley)}
\format{
  A data frame with 108 observations on the following 3 variables.
  \describe{
    \item{\code{site}}{site factor, 18 levels}
    \item{\code{gen}}{genotype factor, 6 levels}
    \item{\code{yield}}{yield, Mg/ha}
  }
}
\details{
  From an experiment in 2003.  Yang (2013) uses this data to illustrate
  a procedure for bootstrapping biplots.

  \tabular{lll}{
    site \tab    long \tab  lat \cr
    Beaverlodge \tab  119.43 \tab 55.21 \cr
    BigLakes \tab  113.70 \tab 53.61 \cr
    Calmar \tab  113.85 \tab 53.26 \cr
    CdcNorth \tab  113.33 \tab 53.63 \cr
    DawsonCreek \tab  120.23 \tab 55.76 \cr
    FtKent \tab  110.61 \tab 54.31 \cr
    FtStJohn \tab  120.85 \tab 56.25 \cr
    Irricana \tab  113.60 \tab 51.32 \cr
    Killam \tab  111.85 \tab 52.78 \cr
    Lacombe \tab  113.73 \tab 52.46 \cr
    LethbridgeDry \tab  112.81 \tab 49.70 \cr
    LethbridgeIrr \tab  112.81 \tab 49.70 \cr
    Lomond \tab  112.65 \tab 50.35 \cr
    Neapolis \tab  113.86 \tab 51.65 \cr
    NorthernSunrise \tab    NA \tab   NA \cr
    Olds \tab  114.09 \tab 51.78 \cr
    StPaul \tab  111.28 \tab 53.98 \cr
    Stettler \tab  112.71 \tab 52.31 \cr
  }

}
\source{
  Rong-Cai Yang (2007).
  Mixed-Model Analysis of Crossover Genotype-Environment Interactions.
  \emph{Crop Science}, 47, 1051-1062.

  Used with permission of Rong-Cai Yang.
}
\references{
  Zhiqiu Hu and Rong-Cai Yang, (2013).
  Improved Statistical Inference for  Graphical Description and
  Interpretation of Genotype x Environment Interaction.
  \emph{Crop Science}, 53, 2400-2410.
}
\examples{

  dat <- yang.barley
  dat <- acast(dat, gen~site, value.var='yield')

\dontrun{

  ## For bootstrapping of a biplot, see the 'bbplot' and
  ## distfree.cr packages here:
  ## http://statgen.ualberta.ca/index.html?open=software.html

  require(SDMTools)
  require(distfree.cr)
  require(bbplot)

  d1 <- bbplot.boot(dat, nsample=2000) # bootstrap the data
  plot(d1) # plot distributions of principal components
  b1 <- bbplot(d1) # create data structures for the biplot
  plot(b1) # create the confidence regions on the biplot
  # this may not be working...
}

}
\keyword{datasets}
