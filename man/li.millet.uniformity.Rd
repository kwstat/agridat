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
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield (grams)}
  }
}
\details{
  Field was 100 ft x 100 ft.  Plots were 15 feet long by 1 foot wide.

  Field width: 100 feet

  Field length: 100 feet

  Li found the most efficient use of land was obtained with plats 15
  feet long and two rowss wide.  Also satisfactory would be one row 30
  feet long.
}
\source{
  Li, HW and Meng, CJ and Liu, TN. 1936.
  Field Results in a Millet Breeding Experiment.
  \emph{Agronomy Journal}, 28, 1-15.  Table 1.
  http://doi.org/10.2134/agronj1936.00021962002800010001x
}

\examples{

data(li.millet.uniformity)
dat <- li.millet.uniformity

mean(dat$yield) # matches Li et al.
if(require(desplot)){
  desplot(yield~col*row, dat,
          aspect=100/100, # true aspect
          main="li.millet.uniformity")
}


}
\keyword{datasets}
