\name{damesa.maize}
\alias{damesa.maize}
\docType{data}
\title{
  Incomplete-block experiment of maize in Ethiopia.
}
\description{
  Incomplete-block experiment of maize in Ethiopia.
}
\usage{data("damesa.maize")}
\format{
  A data frame with 264 observations on the following 8 variables.
  \describe{
    \item{\code{site}}{site, 4 levels}
    \item{\code{rep}}{replicate, 3 levels}
    \item{\code{block}}{incomplete block}
    \item{\code{plot}}{plot number}
    \item{\code{gen}}{genotype, 22 levels}
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, t/ha}
  }
}
\details{
  An experiment harvested in 2012, evaluating drought-tolerant maize
  hybrids at 4 sites in Ethiopia.
  At each, an incomplete-block design was used.

  Damesa et al use this data to compare single-stage and two-stage
  analyses.
  
}
\source{
  Tigist Mideksa Damesa, Jens Möhring, Mosisa Worku, Hans‐Peter Piepho (2017).
  One Step at a Time: Stage‐Wise Analysis of a Series of Experiments.
  Agronomy J, 109, 845-857.
  https://doi.org/10.2134/agronj2016.07.0395
}
\references{
  https://schmidtpaul.github.io/MMFAIR/weighted_two_stage.html
}
\examples{
\dontrun{
  library(agridat)
  libs(desplot)
  desplot(damesa.maize,
          yield ~ col*row|site,
          main="damesa.maize",
          out1=rep, out2=block, num=gen, cex=1)

  if(0){
    # Fit the single-stage model in Damesa
    lib(asreml)
    m0 <- asreml(data=damesa.maize,
             fixed = yield ~ gen,
             random = ~ site + gen:site + at(site):rep/block,
             residual = ~ dsum( ~ units|site) )
    lucid::vc(m0) # match Damesa table 1 column 3
    ##                 effect component std.error z.ratio bound %ch
    ##       at(site, S1):rep   0.08819   0.1814     0.49     P 0  
    ##       at(site, S2):rep   1.383     1.426      0.97     P 0  
    ##       at(site, S3):rep   0              NA      NA     B 0  
    ##       at(site, S4):rep   0.01442   0.02602    0.55     P 0  
    ##                   site  10.45      8.604      1.2      P 0.1
    ##               gen:site   0.1054    0.05905    1.8      P 0.1
    ## at(site, S1):rep:block   0.3312    0.3341     0.99     P 0  
    ## at(site, S2):rep:block   0.4747    0.1633     2.9      P 0  
    ## at(site, S3):rep:block   0              NA      NA     B 0  
    ## at(site, S4):rep:block   0.06954   0.04264    1.6      P 0  
    ##              site_S1!R   1.346     0.3768     3.6      P 0  
    ##              site_S2!R   0.1936    0.06628    2.9      P 0  
    ##              site_S3!R   1.153     0.2349     4.9      P 0  
    ##              site_S4!R   0.1112    0.03665    3        P 0  
  }
}
} 
\keyword{datasets}
