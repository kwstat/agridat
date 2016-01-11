\name{sawyer.multi.uniformity}
\alias{sawyer.multi.uniformity}
\docType{data}
\title{
  Uniformity trials of wheat and swedes, 2 years on the same land.
}
\description{
  Uniformity trials of wheat and swedes at Rothamsted, England, 1925-1926.
}
\usage{data("sawyer.multi.uniformity")}
\format{
  A data frame with 48 observations on the following 7 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{grain}}{wheat grain weight, pounds}
    \item{\code{straw}}{wheat straw weight, pounds}
    \item{\code{leafwt}}{swedes leaf weight, pounds}
    \item{\code{rootwt}}{swedes root weight, pounds}
    \item{\code{rootct}}{swedes root count}
  }
}
\details{
  An experiment conducted at Rothamsted, England, in 1925 and 1926, in
  Sawyers Field. 
  Wheat was planted in 1925. Swedes were planted in 1926.

  Row 6, column 1 was not planted in either year.
  Row 1, column 1 had partially missing data for the wheat values in
  1925 and was not used in the Rothamsted summary statistics.  Note the
  summaries in the report are calibrated to acres.

  The field is 8 plots wide, 8 plots long.  The plots are drawn as
  squares .098 acres each, but the plot dimensions are not actually
  given.  
}
\source{
  Rothamsted Experimental Station Report 1925-26.
  Lawes Agricultural Trust, p. 154-155.
  http://www.era.rothamsted.ac.uk/eradoc/book/84
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
    Engineering Science}, 462, 2119--2143.
  http://doi.org/10.1098/rspa.2006.1667
}
\examples{

data("sawyer.multi.uniformity")
dat <- sawyer.multi.uniformity

round(cor(dat[,3:7], use="pair"),2) # Matches McCullagh p 2121
pairs(dat[,3:7],
      main="sawyer.multi.uniformity")

if(require(desplot)){
  # The field plan (p 154) shows square plots, but this is uncertain
  desplot(grain~col*row, dat,
          flip=TRUE, aspect=1,
          main="sawyer.multi.uniformity - 1925 grain yield")
  desplot(rootwt~col*row, dat,
          flip=TRUE, aspect=1,
          main="sawyer.multi.uniformity - 1926 root weight of swedes")
}

}
\keyword{datasets}
