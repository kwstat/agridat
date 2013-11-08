\name{lyon.potato.uniformity}
\alias{lyon.potato.uniformity}
\docType{data}
\title{
  Uniformity trial of potatoes
}
\description{
  Uniformity trial of potatoes
}

\format{
  A data frame with 204 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row, numeric}
    \item{\code{section}}{Section, numeric}
    \item{\code{yield}}{Yield, in pounds}
  }
}
\details{
  In 1909, potatoes were harvested from uniform land.  There were 34
  rows, 34 inches apart.  Each row was harvested in 6 sections, each
  being 72 feet, 7 inches long.
}

\source{
  Lyon, T.L. (1911). Some experiments to estimate errors in field plat
  tests. \emph{Proc. Amer. Soc. Agron}, 3, 89-114.
  \url{https://www.crops.org/publications/aj/abstracts/3/1/AJ0030010089}
}
\references{
  Harris, J.A. (1920). Practical universality of field heterogeneity as a factor
  influencing plot yields. \emph{Journal of Agricultural Research}, 19, 279-314.
  \url{http://books.google.com/books?id=jyEXAAAAYAAJ&pg=PA279}
}
\examples{

dat <- lyon.potato.uniformity
desplot(yield ~ row*section, dat, tick=TRUE,
        main="lyon.potato.uniformity")

}
\keyword{datasets}
