\name{morgan.multi.uniformity}
\alias{morgan.multi.uniformity}
\docType{data}
\title{
   Uniformity trial of wheat and corn
}
\description{
   Uniformity trial of wheat and corn
}
\usage{data("morgan.multi.uniformity")}
\format{
  A data frame with 126 observations on the following 4 variables.
  \describe{
    \item{\code{col}}{column ordinate}
    \item{\code{plot}}{plot ordinate}
    \item{\code{crop}}{crop name: wheat or cornfodder}
    \item{\code{yield}}{yield of the crop}
  }
}
\details{
  A plat 112.5 feet wide by 945 feet long at Cornell University.
  Plats 15 feet long were harvest separately.
  Wheat harvested summer 1908. Re-planted to corn, harvested
  Sept 28 for fodder. 
  The data given in Morgan (1907) are relative yields, which we converted
  to absolute yields based on the minimum and maximum yields reported.

  Morgan: "We can see that one crop alone cannot be depended upon to 
  determine the relative productiveness of a series of plats."

}
\source{
  Morgan, J. Oscar (1907)
  Some Experiments to Determine the Uniformity of Certain Plats for Field Tests.
  Agronomy Journal, 1, 58-67.
  https://doi.org/10.2134/agronj1907-1909.00021962000100010015x
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(morgan.multi.uniformity)
  dat <- morgan.multi.uniformity
  
  libs(desplot)
  libs(tidyr)
  datw <- pivot_wider(dat, names_from=crop, values_from=yield)
  desplot(datw, wheat ~ col*plot,
          aspect=945/112.5,
          main="morgan.multi.uniformity: wheat yield")
  desplot(datw, cornfodder ~ col*plot,
          aspect=945/112.5,
          main="morgan.multi.uniformity: corn fodder yield")
  plot(datw$wheat, datw$cornfodder,
       xlab="Wheat yield (bu/a)",
       ylab="Corn fodder yield (bu/a)",
       main="morgan.multi.uniformity")
}
}
\keyword{datasets}
