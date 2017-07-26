\name{ryder.groundnut}
\alias{ryder.groundnut}
\docType{data}
\title{
  Wet and dry groundnut yields
}
\description{
    Wet and dry groundnut yields with a possible data error.
}

\format{
  A data frame with 24 observations on the following 6 variables.
  \describe{
    \item{\code{block}}{block}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype factor}
    \item{\code{wet}}{wet yield, kg/plot}
    \item{\code{dry}}{dry yield, kg/plot}
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

  http://doi.org/10.1017/S0014479700011601
}

\examples{

data(ryder.groundnut)
dat <- ryder.groundnut

# RCB model
m1 <- lm(dry~block+gen,dat)
dat$res1 <- resid(m1)

# Table 3 of Ryder.  Scale up from kg/plot to kg/ha
round(dat$res1 * 596.6,0)

# Visually.  Note largest positive/negative residuals are adjacent
if(require(desplot)){
  desplot(res1 ~ col + row, dat,
          text=gen, # aspect unknown
          main="ryder.groundnut - residuals")
}

\dontrun{
  require(desplot)
  # Swap the dry yields for two plots and re-analyze
  dat[dat$block=="B3" & dat$gen=="A", "dry"] <- 2.8
  dat[dat$block=="B3" & dat$gen=="B", "dry"] <- 1.4
  m2 <- lm(dry~block+gen, dat)
  dat$res2 <- resid(m2)
  desplot(res2 ~ col+row, dat,
          # aspect unknown
          text=gen, main="ryder.groundnut")
}

}
\keyword{datasets}
