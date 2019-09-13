\name{li.millet.uniformity}
\alias{li.millet.uniformity}
\docType{data}
\title{
  Uniformity trial of millet
}
\description{
  Uniformity trial of millet at China in 1934.
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

  Crop date estimated to be 1934.
  
  Field was 100 ft x 100 ft.  Plots were 15 feet long by 1 foot wide.

  Field width: 100 plots * 1 foot = 100 feet

  Field length: 6 plots * 15 feet = 100 feet

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
\dontrun{

library(agridat)
  
  data(li.millet.uniformity)
  dat <- li.millet.uniformity

  mean(dat$yield) # matches Li et al.
  
  libs(desplot)
  desplot(yield~col*row, dat,
          aspect=100/100, # true aspect
          main="li.millet.uniformity")
  
}
}
\keyword{datasets}
