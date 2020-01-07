\name{vaneeuwijk.fusarium}
\alias{vaneeuwijk.fusarium}
\docType{data}
\title{
  Infection of wheat varieties by Fusarium strains from 1990 to 1993
}
\description{
  Infection of wheat varieties by Fusarium strains from 1990 to 1993
}
\usage{data("vaneeuwijk.fusarium")}
\format{
  A data frame with 560 observations on the following 4 variables.
  \describe{
    \item{\code{year}}{year, 1990-1993}
    \item{\code{strain}}{strain of fusarium}
    \item{\code{gen}}{genotype/variety}
    \item{\code{y}}{}
  }
}
\details{
  Data come from Hungary. There were 20 wheat varieties infected with 7
  strains of Fusarium in the years 1990-1993.  The measured value is a
  rating of the severity of disease due to Fusarium head blight,
  expressed as a number 1-100.

  Three-way interactions for varieties 21 and 23 were the only ones in
  1992 suffering from strain infections.  This was due to incorrect
  storage of the innoculum (strain) which rendered it incapable of
  infecting most other varieties.
  
  The data is a subset of the data analyzed by VanEeuwijk et al. 1995.
  
  Used with permission of Fred van Eeuwijk.
  
}
\source{
  van Eeuwijk, Fred A. and Pieter M. Kroonenberg (1998).
  Multiplicative Models for Interaction in Three-Way ANOVA, with Applications to Plant Breeding
  Biometrics, 54, 1315-1333.
  http://doi.org/10.2307/2533660
}

\references{
  F. A. van Eeuwijk, A. Mesterhazy, Ch. I. Kling, P. Ruckenbauer,
  L. Saur, H. Burstmayr, M. Lemmens, L. C. P. Keizer, N. Maurin,
  C. H. A. Snijders. (1995).
  Assessing non-specificity of resistance in wheat to head blight caused
  by inoculation with European strains of Fusarium culmorum,
  F. graminearum and F. nivale using a multiplicative model for
  interaction.
  Theor Appl Genet. 90(2), 221-8. 
  http://doi.org/10.1007/BF00222205
}

\examples{
\dontrun{
  
  library(agridat)
  data(vaneeuwijk.fusarium)
  dat <- vaneeuwijk.fusarium
  dat <- transform(dat, year=factor(year))
  dat <- transform(dat, logity=log((y/100)/(1-y/100)))

  libs(HH)
  position(dat$year) <- c(3,9,14,19)
  position(dat$strain) <- c(2,5,8,11,14,17,20)
  HH::interaction2wt(logity ~ gen+year+strain,dat,rot=c(90,0),
                     x.between=0, y.between=0,
                     main="vaneeuwijk.fusarium")


  # anova on logit scale. Near match to VanEeuwijk table 6
  m1 <- aov(logity ~ gen*strain*year, data=dat)
  anova(m1)
  ## Response: logity
  ##                  Df Sum Sq Mean Sq F value Pr(>F)
  ## gen              19 157.55   8.292               
  ## strain            6  91.54  15.256               
  ## year              3 321.99 107.331               
  ## gen:strain      114  34.03   0.299               
  ## gen:year         57 140.94   2.473               
  ## strain:year      18 236.95  13.164               
  ## gen:strain:year 342  93.15   0.272
  
}
}
\keyword{datasets}
