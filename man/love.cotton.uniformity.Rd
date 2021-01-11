\name{love.cotton.uniformity}
\alias{love.cotton.uniformity}
\docType{data}
\title{
  Uniformity trial of cotton
}
\description{
  Uniformity trial of cotton
}
\usage{data("love.cotton.uniformity")}
\format{
  A data frame with 170 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  Within each 100-foot row, the first 20 feet were harvested as a single plot,
  and then the rest of the row was harvested in 5-foot lengths.

  Crop location is unknown, but likely Southeast Asia given Love's work
  teaching in China. Date circa 1930.

  Possibly more information would be in the collected papers of Harry
  Love at Cornell:
  https://rmc.library.cornell.edu/EAD/htmldocs/RMA00890.html
  Cotton - Plot Technic Study 1930-1932. Box 3, Folder 34
}

\source{
  Harry Love (1937).
  Application of Statistical Methods to Agricultural Research.
  The Commercial Press, Shanghai. Page 411.
  https://archive.org/details/in.ernet.dli.2015.233346/page/n421
}

\references{
  None.
}

\examples{
\dontrun{

library(agridat)

  data(love.cotton.uniformity)
  # omit first column which has 20-foot plots
  dat <- subset(love.cotton.uniformity, col > 1)

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=20/80, # just a guess
          main="love.cotton.uniformity")
  
}
}
\keyword{datasets}
