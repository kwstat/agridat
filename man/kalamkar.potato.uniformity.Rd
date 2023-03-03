\name{kalamkar.potato.uniformity}
\alias{kalamkar.potato.uniformity}
\docType{data}
\title{
  Uniformity trial of potatoes
}
\description{
  Uniformity trial of potatoes at Saskatchewan, Canada, 1929.
}
\usage{data("kalamkar.potato.uniformity")}
\format{
  A data frame with 576 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield of potatoes per plot}
  }
}
\details{
  The data is for potato yields in 96 rows, each 132 feet long, with 3
  feet between rows.

  Each row was harvested as six plots, each 22 feet long.  Each hill had
  one seed piece.  Hills were spaced 2 feet apart in each row.

  Field width: 6 plots * 22 feet = 132 feet

  Field length: 96 rows * 3 feet = 288 feet

  Units of yield are not given, but might appear in the paper by Kirk
  (no access).
}
\source{
  Kalamkar, R.J. (1932).
  Experimental Error and the Field-Plot Technique with Potatoes.
  The Journal of Agricultural Science, 22, 373-385.
  https://doi.org/10.1017/S0021859600053697
}
\references{
  Kirk, L. E. (1929)
  Field plot technique with potatoes with special reference to the Latin
  square.
  Scientific Agriculture, 9, 719.
  https://doi.org/10.4141/sa-1929-0067
}
\examples{
\dontrun{

library(agridat)
data(kalamkar.potato.uniformity)
dat <- kalamkar.potato.uniformity

# Similar to figure 1 of Kalamkar
libs(desplot)
desplot(dat, yield~col*row,
        flip=TRUE, tick=TRUE, aspect=288/132, # true aspect
        main="kalamkar.potato.uniformity")
  
}
}
\keyword{datasets}
