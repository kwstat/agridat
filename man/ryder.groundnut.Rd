\name{ryder.groundnut}
\alias{ryder.groundnut}
\docType{data}
\title{
  Wet and dry groundnut yields
}
\description{
    Wet and dry groundnut yields with a possible data error.
}
\usage{data(ryder.groundnut)}
\format{
  A data frame with 24 observations on the following 6 variables.
  \describe{
    \item{\code{block}}{Block factor}
    \item{\code{row}}{Row}
    \item{\code{column}}{Column}
    \item{\code{gen}}{Genotype factor}
    \item{\code{wet}}{Wet yield, kg/plot}
    \item{\code{dry}}{Dry yield, kg/plot}
  }
}
\details{
  Ryder (1981) uses this data to discuss the importance of looking at
  the field plan for an experiment.  Based on analysis of the residuals,
  he suggests that varieties A and B in block 3 may have had their data
  swapped.
}
\source{
  K. Ryder (1981). Field plans: why the biometrician finds them useful,
  \emph{Experimental Agriculture}, 17, 243--256.
}
\examples{
dat <- ryder.groundnut

# RCB model
m1 <- lm(dry~block+gen,dat)
dat$res1 <- resid(m1)

# Table 3 of Ryder.  Scale up from kg/plot to kg/ha
round(dat$res1 * 596.6,0)

# Visually.  Note largest positive/negative residuals are adjacent
desplot(res1 ~ column + row, dat, text=gen)

# Swap the dry yields for the plots and re-analyze
dat[dat$block=="B3" & dat$gen=="A", "dry"] <- 2.8
dat[dat$block=="B3" & dat$gen=="B", "dry"] <- 1.4
m2 <- lm(dry~block+gen, dat)
dat$res2 <- resid(m2)
desplot(res2 ~ column+row, dat, text=gen)

}
\keyword{datasets}
