\name{holland.arthropods}
\alias{holland.arthropods}
\docType{data}
\title{
  Counts of arthropods in a grid-sampled wheat field
}
\description{
  Counts of arthropods in a grid-sampled wheat field
}
\usage{data(holland.arthropods)}
\format{
  A data frame with 63 observations on the following 8 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{n.brevicollis}}{species counts}
    \item{\code{linyphiidae}}{species counts}
    \item{\code{collembola}}{species counts}
    \item{\code{carabidae}}{species counts}
    \item{\code{lycosidae}}{species counts}
    \item{\code{weedcover}}{percent weed cover}
  }
}
\details{
  Arthropods were sampled at 30m x 30m grid in a wheat field near
  Wimborne, Dorest, UK on 6 dates in Jun/Jul 1996.  Arthropod counts were
  aggregated across the 6 dates.

  Holland et al. used SADIE (Spatial Analysis by Distance Indices) to
  look for spatial patterns.  Significant patterns were found for
  N. brevicollis, Carabidae, Lycosidae.  The Lycosidae counts were also
  significantly associated with weed cover.
}
\source{
  Holland J. M., Perry J. N., Winder, L. (1999).
  The within-field spatial and temporal distribution of arthropods
  within winter wheat.
  Bulletin of Entomological Research, 89: 499-513.  Figure 3 (large
  grid in 1996).

  Used with permission of John Holland.
}

\examples{

data(holland.arthropods)
dat <- holland.arthropods

require(lattice)
contourplot(linyphiidae ~ col*row, dat, at=c(0,40,80,120,160,200), region=TRUE,
            col.regions=c('gray90','gray70','gray50','gray30','gray10'),
            main="holland.arthropods - linyphiidae counts in winter wheat")

\dontrun{
contourplot(n.brevicollis ~ col*row, dat, region=TRUE)
contourplot(linyphiidae~ col*row, dat, region=TRUE)
contourplot(collembola ~ col*row, dat, region=TRUE)
contourplot(carabidae ~ col*row, dat, region=TRUE)
contourplot(lycosidae ~ col*row, dat, region=TRUE)
contourplot(weedcover ~ col*row, dat, region=TRUE)
}

}
\keyword{datasets}
