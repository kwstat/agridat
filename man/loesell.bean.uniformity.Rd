\name{loesell.bean.uniformity}
\alias{loesell.bean.uniformity}
\docType{data}
\title{
  Uniformity trial of white pea beans
}
\description{
  Uniformity trial of white pea beans
}
\usage{data("loesell.bean.uniformity")}
\format{
  A data frame with 1890 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, grams per plot}
  }
}
\details{
  Trial conducted at Michigan Agricultural Experiment Station, 1.75
  acres. Beans were planted in rows 28 inches apart on 15 Jun
  1932. Plants spaced 1 to 2 inches apart. After planting, an area 210
  ft x 210 feet. This area was divided into 21 columns, each 10 foot
  wide, and each containing90 rows.
  
  Field length: 90 rows * 28 inches = 210 feet.

  Field width: 21 series * 10 feet = 210 feet.

  Author's conclusion: Increasing the size of the plot by increasing its
  length was more efficient than increasing its width.

  Note, the missing values in this dataset are a result of the PDF scan
  omitting corners of the table.
  
}
\source{
  Loesell, Clarence (1936). 
  Size of plot & number of replications necessary for varietal trials
  with white pea beans.
  PhD Thesis, Michigan State. Table 3, p. 9-10.
  https://d.lib.msu.edu/etd/5271
}
\references{
  None
}
\examples{
\dontrun{
  require(agridat)
  data(loesell.bean.uniformity)
  dat <- loesell.bean.uniformity
  require(desplot)
  desplot(yield ~ col*row, dat,
          flip=TRUE, aspect=1, tick=TRUE,
          main="loesell.bean.uniformity")
}
}
\keyword{datasets}
