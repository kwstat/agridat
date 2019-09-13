\name{hunter.corn}
\alias{hunter.corn}
\docType{data}
\title{
  Multi-environment trial of corn with nitrogen fertilizer
}
\description{
  Corn yield response to nitrogen
}

\format{
  A data frame with 54 observations on the following 4 variables.
  \describe{
    \item{\code{nitro}}{nitrogen fertilizer, pound/acre}
    \item{\code{year}}{year}
    \item{\code{loc}}{location}
    \item{\code{yield}}{yield, bu/ac}
  }
}
\details{
  Experiments were conducted in eastern Oregon during the years
  1950-1952.

  Planting rates varied from 15,000 to 21,000 planter per acre.
}
\source{
  Albert S. Hunter, John A. Yungen (1955).  The Influence of
  Variations in Fertility Levels Upon the Yield and Protein
  Content of Field Corn in Eastern Oregon.
  \emph{Soil Science Society of America Journal}, 19, 214-218.
  http://doi.org/10.2136/sssaj1955.03615995001900020027x
}
\references{
  James Leo Paschal, Burton Leroy French (1956).
  A method of economic analysis applied to nitrogen fertilizer rate
  experiments on irrigated corn.
  Tech Bull 1141. United States Dept of Agriculture.
  books.google.com/books?id=gAdZtsEziCcC&pg=PP1
}

\examples{

library(agridat)
data(hunter.corn)
dat <- hunter.corn

dat <- transform(dat, env=factor(paste(loc,year)))

libs(lattice)
xyplot(yield~nitro|env, dat, type='b',
main="hunter.corn - nitrogen response curves")

}
\keyword{datasets}
