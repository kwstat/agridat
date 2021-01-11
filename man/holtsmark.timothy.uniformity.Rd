\name{holtsmark.timothy.uniformity}
\alias{holtsmark.timothy.uniformity}
\docType{data}
\title{
  Uniformity trial of timothy
}
\description{
  Uniformity trial of timothy hay circa 1905
}
\usage{data("holtsmark.timothy.uniformity")}
\format{
  A data frame with 240 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield per plot, kg}
  }
}
\details{

  Field width: 40 plots * 5 m = 200 m.

  Field length: 6 plots * 5 m = 30 m

  Holtsmark & Larsen used this trial to compare standard deviations of
  different sized plots (combined from smaller plots).
  
}
\source{
  Holtsmark, G and Larsen, BR (1905).
  Om Muligheder for at indskraenke de Fejl, som ved Markforsog betinges af Jordens Uensartethed.
  Tidsskrift for Landbrugets Planteavl. 12, 330-351. (In Danish)
  https://books.google.com/books?id=MdM0AQAAMAAJ&pg=PA330
  https://dca.au.dk/publikationer/historiske/planteavl/

  Uber die Fehler, welche bei Feldversuchen, durch die Ungleichartigkeit des Bodens bedingt werden.
  Die Landwirtschaftlichen Versuchs-Stationen, 65, 1--22. (In German)
  https://books.google.com/books?id=eXA2AQAAMAAJ&pg=PA1
}
\references{
  Theodor Roemer (1920). \emph{Der Feldversuch}.
}

\examples{
\dontrun{

library(agridat)
data(holtsmark.timothy.uniformity)
dat <- holtsmark.timothy.uniformity

# Define diagonal 'check' plots like Holtsmark does
dat <- transform(dat,
                 check = ifelse(floor((row+col)/3)==(row+col)/3, "C", ""))
                 
libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, text=check, show.key=FALSE,
        aspect=30/200, # true aspect
        main="holtsmark.timothy.uniformity")

# sd(dat$yield) # 2.92 matches Holtsmark p. 348

}
}
\keyword{datasets}
