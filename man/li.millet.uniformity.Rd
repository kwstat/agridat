\name{li.millet.uniformity}
\alias{li.millet.uniformity}
\docType{data}
\title{
  Uniformity trial of millet
}
\description{
  Uniformity trial of millet at China.
}

\format{
  A data frame with 600 observations on the following 3 variables.
  \describe{
    \item{\code{col}}{column}
    \item{\code{row}}{row}
    \item{\code{yield}}{yield (grams)}
  }
}
\details{
  Field was 100 ft x 100 ft.  Plots were 15 feet long by 1 foot wide.
}
\source{
  Li, HW and Meng, CJ and Liu, TN. 1936.
  Field Results in a Millet Breeding Experiment.
  \emph{Agronomy Journal}, 28, 1-15.  Table 1.
  \url{http://doi.org/10.2134/agronj1936.00021962002800010001x}
}

\examples{

data(li.millet.uniformity)
dat <- li.millet.uniformity

mean(dat$yield) # matches Li et al.
if(require(desplot)){
  desplot(yield~col*row, dat, main="li.millet.uniformity", aspect=100/100)
}


}
\keyword{datasets}
