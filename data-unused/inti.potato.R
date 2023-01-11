# inti.potato.R

# Reason not used: ?

# Data retrieved from "inti" package, which has license GPL3
# https://github.com/Flavjack/inti

## ---------------------------------------------------------------------------
load("c:/Users/wrightkevi/Downloads/potato.rda")
head(potato)
dim(potato)

alias{potato}
\title{Water use efficiency in 15 potato genotypes}
\format{
A data frame with 150 rows and 17 variables: 

\describe{
  \item{treat}{Water deficit treatments: sequia, irrigado}
  \item{geno}{15 potato genotypes}
  \item{bloque}{blocks for the experimentl design}
  \item{spad_29}{Relative chlorophyll content (SPAD) at 29 day after planting}
  \item{spad_83}{Relative chlorophyll content (SPAD) at 84 day after planting}
  \item{rwc_84}{Relative water content (percentage) at 84 day after planting}
  \item{op_84}{Osmotic potential (Mpa) at 84 day after planting }
  \item{leafdw}{leaf dry weight (g)}
  \item{stemdw}{stem dry weight (g)}
  \item{rootdw}{root dry weight (g)}
  \item{tubdw}{tuber dry weight (g)}
  \item{biomdw}{total biomass dry weight (g)}
  \item{hi}{harvest index}
  \item{ttrans}{total transpiration (l)}     
  \item{wue}{water use effiency (g/l)} 
  \item{twue}{tuber water use effiency (g/l)} 
  \item{lfa}{leaf area (cm2)}  
  }
}
\usage{
potato
}
\description{
Experiment to evaluate the physiological response from 15 potatos genotypes
under water deficit condition. The experiment had a randomized complete block
design with five replications. The stress started at 30 day after planting.
}
\keyword{datasets}
