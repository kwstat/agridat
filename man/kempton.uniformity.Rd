\name{kempton.uniformity}
\alias{kempton.uniformity}
\docType{data}
\title{
  Uniformity trial of Spring Barley in 1978
}
\description{
  Uniformity trial of Spring Barley in 1978
}
\details{
  A uniformity trial of spring barley planted in 1978.
  Each plot is 5 feet wide, 14 feet long. 
  Conducted by the Plant Breeding Institute in Cambridge, England.
}
\usage{kempton.uniformity}
\format{
  A data frame with 196 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row position}
    \item{\code{col}}{Column position}
    \item{\code{yield}}{Grain yield, kg}
  }
}
\source{
  R. A. Kempton and C. W. Howes (1981). The use of neighbouring plot
  values in the analysis of variety trials. \emph{Applied Statistics},
  30, 59--70.
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  Proceedings of the Royal Society A: Mathematical, Physical and
  Engineering Science. 462, 2119--2143.
}
\examples{
dat <- kempton.uniformity

require(lattice)
desplot(yield~col*row, dat)
asp <- (28*14)/(7*5) # aspect ratio (rows * ft)/(cols * ft)
desplot(yield~col*row, dat, aspect=asp) # true view
}
