\name{obsi.potato.uniformity}
\alias{obsi.potato.uniformity}
\docType{data}
\title{
  Uniformity trial of potato in Africa 2001
}
\description{
  Uniformity trial of potato in Africa in 2001
}
\usage{data("obsi.potato.uniformity")}
\format{
  A data frame with 2569 observations on the following 4 variables.
  \describe{
    \item{\code{loc}}{location, 2 levels}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  Data collected from potato uniformity trials at Hollota (L1) and Kulumsa (L2).
  Each field was 0.15 hectares.
  In each field, 75cm between rows and 60cm between plants. The basic
  units harvested were 1.2m x 1.5m. It is not clear which way the plots
  are oriented in the field with respect to the rows and columns.

  At location L1, plot (10,7) was 22.5 in the source document, but was
  changed to 2.25 for this electronic data.

  Note the horizontal banding of 8 or 9 rows at location L1.
  
}
\source{
  Dechassa Obsi. 2008.
  Application of Spatial Modeling to the Study of Soil Fertility Pattern.
  MS Thesis, Addis Ababa University. Page 122-125.
  https://etd.aau.edu.et/handle/123456789/3221
}
\references{
  None.
}
\examples{
library(agridat)
data(obsi.potato.uniformity)
dat <- obsi.potato.uniformity

# libs(dplyr)
# dat <- group_by(dat, loc)
# summarize(dat, yield=mean(yield))
##   loc   yield
##   <fct> <dbl>
## 1 L1     2.54 # Obsi says 2.55
## 2 L2     5.31 # Obsi says 5.36

\dontrun{
libs(desplot)
desplot(dat, yield ~ col*row, subset=loc=="L1",
  main="obsi.potato.uniformity - loc L1",
  flip=TRUE, tick=TRUE)
desplot(dat, yield ~ col*row, subset=loc=="L2",
  main="obsi.potato.uniformity - loc L2",
  flip=TRUE, tick=TRUE)
}
}
\keyword{datasets}
