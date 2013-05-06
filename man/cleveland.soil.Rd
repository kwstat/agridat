\name{cleveland.soil}
\alias{cleveland.soil}
\docType{data}
\title{
  Soil resistivity in a field
}
\description{
  Soil resistivity in a field
}
\usage{data(cleveland.soil)}
\format{
  A data frame with 8641 observations on the following 5 variables.
  \describe{
    \item{\code{northing}}{y ordinate}
    \item{\code{easting}}{x ordinate}
    \item{\code{resistivity}}{Soil resistivity, ohms}
    \item{\code{is.ns}}{Indicator of north/south track}
    \item{\code{track}}{Track number}
  }
}
\details{
  Resistivity is related to soil salinity.
}
\source{
  William Cleveland, (1993), \emph{Visualizing Data}.
  Electronic version from StatLib,
  \url{http://lib.stat.cmu.edu/datasets/}.
  
  Cleaned version from Luke Tierney
  \url{http://homepage.stat.uiowa.edu/~luke/classes/248/examples/soil}
}
\examples{
\dontrun{

data(cleveland.soil)
dat <- cleveland.soil

# Similar to Cleveland fig 4.64
library(latticeExtra)
levelplot(resistivity ~ easting + northing, data = dat,
          col.regions=colorRampPalette(c("red","gray","blue")),
          panel=panel.levelplot.points,
          aspect=2.4, xlab= "Easting (km)", ylab= "Northing (km)")

# Profile plots of each track. Cleveland fig 4.66
xyplot(resistivity ~ easting | factor(track), data = dat, subset=!is.ns,
       layout = c(4,10), strip=strip.custom(style=3, fg=NA),
       panel = function(x, y) {
         panel.grid(h = 2)
         panel.xyplot(x, y, pch = ".", cex = 1.25)
       } ,
       xlab = "Easting (km)", ylab = "Resistivity (ohm-cm)")

# 2D loess plot. Cleveland fig 4.68
sg1 <- expand.grid(easting = seq(.15, 1.410, by = .015),
                        northing = seq(.150, 3.645, by = .015))
fit1 <- with(dat,
                predict(loess(resistivity~easting*northing, span = 0.25, 
                        degree = 2), sg1))
levelplot(fit1 ~ sg1$easting * sg1$northing,
          col.regions=colorRampPalette(c("red","gray","blue")),
          cuts = 9,
          aspect=2.4, xlab = "Easting (km)", ylab = "Northing (km)")

# 3D loess plot with data overlaid
library(rgl)
bg3d(color = "white")
clear3d()
points3d(dat$easting, dat$northing, dat$resistivity / 100,
         col = rep("gray50", nrow(dat)))
surface3d(seq(.15, 1.410, by = .015),seq(.150, 3.645, by = .015),
          fit1/100, alpha=0.9, col=rep("wheat", length(fit1)),
          front="fill", back="fill")
}
}
\keyword{datasets}
