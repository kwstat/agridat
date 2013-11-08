\name{odland.soybean.uniformity}
\alias{odland.soybean.uniformity}
\alias{odland.soyhay.uniformity}
\docType{data}
\title{
  Uniformity trials of soy hay and soybeans.
}
\description{
  Uniformity trials of soy hay and soybeans.
}

\format{
  Data frames with 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield}
  }
}
\details{

Grown at West Virginia Experiment Station in 1925/1926.  Soybeans were
planted in rows 30 inches apart.

In 1925 the crop was harvested for forage, 42 rows, each 200 feet long.
Yields of 8-foot plats recorded.

In 1926 the crop was harvested for seed, 55 rows, each 232 feet
long. Yields of 8-foot plats were recorded.

In 1926, data for the last row seems to partially missing.

Odland and Garber provide no agronomic context for the yield variation.
}

\source{
  Odland, TE and Garber, RJ. 1928.
  Size of Plat and Number of Replications in Field Experiments with
  Soybeans.
  \emph{Agronomy Journal}, 20, 93--108.
}

\examples{

dat1 <- odland.soyhay.uniformity
desplot(yield ~ col*row, dat1, flip=TRUE,
        aspect=200/(42*30/12), # true aspect ratio
        main="odland.soyhay.uniformity")


dat2 <- odland.soybean.uniformity
desplot(yield ~ col*row, dat2, flip=TRUE,
        aspect = 232/(55*30/12), # true aspect
        main="odland.soybean.uniformity")

}
\keyword{datasets}
