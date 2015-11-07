\name{broadbalk.wheat}
\alias{broadbalk.wheat}
\docType{data}
\title{
  Long term wheat yields on Broadbalk fields at Rothamsted.
}
\description{
  Long term wheat yields on Broadbalk fields at Rothamsted.
}

\format{
  A data frame with 1258 observations on the following 4 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{plot}}{plot factor}
    \item{\code{grain}}{grain yield, tonnes}
    \item{\code{straw}}{straw yield, tonnes}
  }
}
\details{
  Rothamsted Experiment station conducted wheat experiments on the
  Broadbalk Fields beginning in 1844 with data for yields of grain and
  straw collected from 1852 to 1925.
  Ronald Fisher was hired to analyze data from the agricultural trials.
  Organic manures and inorganic fertilizer treatments were applied in
  various combinations to the plots.

  N1 is 48kg, N1.5 is 72kg, N2 is 96kg, N4 is 192kg nitrogen.

  \tabular{ll}{
    Plot \tab Treatment\cr
    2b   \tab  manure \cr
    3    \tab  No fertilizer or manure \cr
    5    \tab  P K Na Mg (No N)\cr
    6    \tab  N1 P K Na Mg \cr
    7    \tab  N2 P K Na Mg \cr
    8    \tab  N3 P K Na Mg \cr
    9    \tab  N1* P K Na Mg since 1894; 9A and 9B received different treatments 1852-93\cr
    10   \tab  N2 \cr
    11   \tab  N2 P\cr
    12   \tab  N2 P Na* \cr
    13   \tab  N2 P K \cr
    14   \tab  N2 P Mg* \cr
    15   \tab  N2 P K Na Mg (timing of N application different to other plots, see below)\cr
    16   \tab  N4 P K Na Mg 1852-64; unmanured 1865-83; N2*P K Na Mg since 1884\cr
    17   \tab  N2 applied in even years; P K Na Mg applied in odd years \cr
    18   \tab  N2 applied in odd years; P K Na Mg applied in even years \cr
    19   \tab  N1.5 P and rape cake 1852-78, 1879-1925 rape cake only\cr
  }
}
\source{
  D.F. Andrews and A.M. Herzberg. 1985.
	\emph{Data: A Collection of Problems from Many Fields for the Student
	  and Research Worker}.  Springer.

  Retrieved from \url{http://lib.stat.cmu.edu/datasets/Andrews/}.
}
\references{
  Broadbalk Winter Wheat Experiment.
  \url{http://www.era.rothamsted.ac.uk/index.php?area=home&page=index&dataset=4}
}
\examples{

data(broadbalk.wheat)
dat <- broadbalk.wheat

require(lattice)
xyplot(grain~straw|plot, dat, type=c('p','smooth'), as.table=TRUE,
       main="broadbalk.wheat")
## xyplot(grain~year|plot, dat, type=c('p','smooth'), as.table=TRUE,
##        main="broadbalk.wheat") # yields are decreasing

# See the treatment descriptions to understand the patterns
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(grain~year*plot, dat, main="broadbalk.wheat: Grain", col.regions=redblue)
levelplot(straw~year*plot, dat, main="broadbalk.wheat: Straw", col.regions=redblue)

}
\keyword{datasets}
