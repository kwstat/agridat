\name{sawyer.multi.uniformity}
\alias{sawyer.multi.uniformity}
\docType{data}
\title{
  Uniformity trials of wheat, swedes, oats, 3 years on the same land.
}
\description{
  Uniformity trials of wheat, swedes, oats at Rothamsted, England, 1925-1927.
}
\usage{data("sawyer.multi.uniformity")}
\format{
  A data frame with 48 observations on the following 7 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{crop}}{crop}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{grain}}{wheat/oats grain weight, pounds}
    \item{\code{straw}}{wheat/oats straw weight, pounds}
    \item{\code{leafwt}}{swedes leaf weight, pounds}
    \item{\code{rootwt}}{swedes root weight, pounds}
    \item{\code{rootct}}{swedes root count}
  }
}
\details{
  
  An experiment conducted at Rothamsted, England, in 1925-1927, in
  Sawyers Field.

  Row 6, column 1 was not planted in any year.
  
  Wheat was harvested in 1925.
  Row 1, column 1 had partially missing data for the wheat values in
  1925 and was not used in the Rothamsted summary statistics on page 155.
  
  Swedes were harvested in 1926.
  
  Oats were harvested in 1927.
  
  Note the summaries statistics at the bottom of the page in each report
  are calibrated to ACRES.

  The field is 8 plots wide, 6 plots long.  The plots are drawn in the
  source documents as squares .098 acres each, but the plot dimensions
  are not actually given.
  
}
\source{
  Rothamsted Experimental Station, Report 1925-26.
  Lawes Agricultural Trust, p. 154-155.
  http://www.era.rothamsted.ac.uk/eradoc/book/84

  Rothamsted Experimental Station, Report 1927-1928.
  Lawes Agricultural Trust, p. 153.  
  http://www.era.rothamsted.ac.uk/eradoc/article/ResReport1927-28-131-175
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
    Engineering Science}, 462, 2119--2143.
  http://doi.org/10.1098/rspa.2006.1667

  Winifred A. Mackenzie. (1926)
  Note on a remarkable correlation between grain and straw, obtained at
  Rothamsted.
  \emph{Journal of Agricultural Science}, 16, 275-279.
  https://doi.org/10.1017/S0021859600018256
  
}
\examples{

data("sawyer.multi.uniformity")
dat <- sawyer.multi.uniformity

if(require(desplot)){
  # The field plan shows square plots, but this is unlikely
  desplot(grain~col*row, subset(dat, year==1925),
          main="sawyer.multi.uniformity - 1925 wheat grain yield")
  desplot(rootwt~col*row, subset(dat, year==1926),
          main="sawyer.multi.uniformity - 1926 root weight of swedes")
  desplot(grain~col*row, subset(dat, year==1927),
          main="sawyer.multi.uniformity - 1927 oats grain yield")
}

# This plot shows the outlier in the wheat data reported by Mackenzie.
# require(lattice)
# xyplot(grain ~ straw, data=subset(dat, year==1925))

# round(cor(dat[,7:9], use="pair"),2) # Matches McCullagh p 2121
##        leafwt rootwt rootct
## leafwt   1.00   0.66   0.47
## rootwt   0.66   1.00   0.43
## rootct   0.47   0.43   1.00

## pairs(dat[,7:9],
##       main="sawyer.multi.uniformity")

}
\keyword{datasets}
