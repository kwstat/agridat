\name{barrero.maize}
\alias{barrero.maize}
\docType{data}
\title{
  Multi-environment trial of maize in Texas.
}
\description{
  Multi-environment trial of maize in Texas.
}
\usage{data("barrero.maize")}
\format{
  A data frame with 14568 observations on the following 15 variables.
  \describe{
    \item{\code{year}}{year of testing, 2000-2010}
    \item{\code{yor}}{year of release, 2000-2010}
    \item{\code{loc}}{location, 16 places in Texas}
    \item{\code{env}}{environment (year+loc), 107 levels}
    \item{\code{rep}}{replicate, 1-4}
    \item{\code{gen}}{genotype, 847 levels}
    \item{\code{daystoflower}}{numeric}
    \item{\code{plantheight}}{plant height, cm}
    \item{\code{earheight}}{ear height, cm}
    \item{\code{population}}{plants per hectare}
    \item{\code{lodged}}{percent of plants lodged}
    \item{\code{moisture}}{moisture percent}
    \item{\code{testweight}}{test weight kg/ha}
    \item{\code{yield}}{yield, Mt/ha}
  }
}
\details{

  This is a large (14500 records), multi-year, multi-location, 10-trait
  dataset from the Texas AgriLife Corn Performance Trials.
  
  These data are from 2-row plots approximately 36in wide by 25 feet long.

  Barrero et al. used this data to estimate the genetic gain in maize
  hybrids over a 10-year period of time.
  
  Used with permission of Seth Murray.
}
\source{
  Barrero, Ivan D. et al. (2013).
  A multi-environment trial analysis shows slight grain yield improvement in Texas commercial maize.
  Field Crops Research, 149, Pages 167-176.
  https://doi.org/10.1016/j.fcr.2013.04.017
}
\references{
  None.
}
\examples{
\dontrun{
  library(agridat)
  data(barrero.maize)
  dat <- barrero.maize

  library(lattice)
  bwplot(yield ~ factor(year)|loc, dat,
         main="barrero.maize - Yield trends by loc",
         scales=list(x=list(rot=90)))
  
  # Table 6 of Barrero. Model equation 1.
  pacman::p_load(dplyr, asreml, lucid)
  dat <- arrange(dat, env)
  dat <- mutate(dat,
                yearf=factor(year), env=factor(env),
                loc=factor(loc), gen=factor(gen), rep=factor(rep))
  
  m1 <- asreml(yield ~ loc + yearf + loc:yearf, data=dat,
               random = ~ gen + rep:loc:yearf +
                 gen:yearf + gen:loc +
                 gen:loc:yearf,
               residual = ~ dsum( ~ units|env) )
  
  # Variance components for yield match Barrero table 6.
  lucid::vc(m1)[1:5,]
  ##        effect component std.error z.ratio bound %ch
  ## rep:loc:yearf   0.111     0.01092    10       P 0  
  ##           gen   0.505     0.03988    13       P 0  
  ##     gen:yearf   0.05157   0.01472     3.5     P 0  
  ##       gen:loc   0.02283   0.0152      1.5     P 0.2
  ## gen:loc:yearf   0.2068    0.01806    11       P 0  
  
  summary(vc(m1)[6:112,"component"]) # Means match last row of table 6
  ##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  ## 0.1286  0.3577  0.5571  0.8330  1.0322  2.9867 
  
}
}
\keyword{datasets}
