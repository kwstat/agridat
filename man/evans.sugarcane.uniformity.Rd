\name{evans.sugarcane.uniformity}
\alias{evans.sugarcane.uniformity}
\docType{data}
\title{
  Uniformity trial of sugarcane
}
\description{
  Uniformity trial of sugarcane in Mauritius.
}
\usage{data("evans.sugarcane.uniformity")}
\format{
  A data frame with 710 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{plot yield}
  }
}
\details{
  A field of ratoon canes was harvested in 20-hole plots.
  
  Described in a letter to Frank Yates written 21 May 1935.

  Field length: 5 plots x 50 feet (20 stools per plot; 30 inches between stools) = 250 feet

  Field width: 142 plots x 5 feet = 710 feet
  
  This data was made available with special help from the staff at
  Rothamsted Research Library.
}
\source{
  Rothamsted Research Library, Box STATS17  WG Cochran, Folder 8.
}
\references{
  None.
}
\examples{
\dontrun{
  data(evans.sugarcane.uniformity)
  dat <- evans.sugarcane.uniformity
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=(5*50)/(142*5), # true aspect
          main="evans.sugarcane.uniformity")

  table( substring(dat$yield,3) ) # yields ending in 0,5 are much more common
}
}
\keyword{datasets}
