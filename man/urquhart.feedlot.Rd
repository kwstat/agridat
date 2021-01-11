\name{urquhart.feedlot}
\alias{urquhart.feedlot}
\docType{data}
\title{
  Weight gain calves in a feedlot
}
\description{
  Weight gain calves in a feedlot, given three different diets.
}
\usage{data("urquhart.feedlot")}
\format{
  A data frame with 67 observations on the following 5 variables.
  \describe{
    \item{\code{animal}}{animal ID}
    \item{\code{herd}}{herd ID}
    \item{\code{diet}}{diet: Low, Medium, High}
    \item{\code{weight1}}{initial weight}
    \item{\code{weight2}}{slaughter weight}
  }
}
\details{
  
  Calves born in 1975 in 11 different herds entered a feedlot as
  yearlings. Each animal was fed one of three diets with low, medium, or
  high energy. The original sources explored the use of some contrasts
  for comparing breeds.

  \tabular{ll}{
    Herd \tab Breed \cr
    9 \tab New Mexico Herefords \cr
    16 \tab  New Mexico Herefords \cr
    3 \tab Utah State University Herefords \cr
    32 \tab Angus \cr
    24 \tab  Angus x Hereford (cross) \cr
    31 \tab Charolais x Hereford \cr
    19 \tab Charolais x Hereford \cr
    36 \tab Charolais x Hereford \cr
    34 \tab Brangus \cr
    35 \tab Brangus \cr
    33 \tab Southern Select \cr
  }
  
}
\source{
  N. Scott Urquhart (1982).
  Adjustment in Covariance when One Factor Affects the Covariate
  Biometrics, 38, 651-660.  Table 4, p. 659.
  https://doi.org/10.2307/2530046
}
\references{
  N. Scott Urquhart and David L. Weeks (1978).
  Linear Models in Messy Data: Some Problems and Alternatives
  Biometrics, 34, 696-705.
  https://doi.org/10.2307/2530391

  Also available in the 'emmeans' package as the 'feedlot' data.
}
\examples{
\dontrun{
  
  library(agridat)
  data(urquhart.feedlot)
  dat <- urquhart.feedlot

  libs(reshape2)
  d2 <- melt(dat, id.vars=c('animal','herd','diet'))

  libs(latticeExtra)
  useOuterStrips(xyplot(value ~ variable|diet*herd, data=d2, group=animal,
                        type='l',
                        xlab="Initial & slaughter timepoint for each diet",
                        ylab="Weight for each herd",
                        main="urquhart.feedlot - weight gain by animal"))


  # simple fixed-effects model 
  dat <- transform(dat, animal = factor(animal), herd=factor(herd))
  m1 <- lm(weight2 ~ weight1 + herd*diet, data = dat)
  coef(m1) # weight1 = 1.1373 match Urquhart table 5 common slope
  
  # random-effects model might be better, for example
  # libs(lme4)
  # m1 <- lmer(weight2 ~ -1 + diet + weight1 + (1|herd), data=dat)
  # summary(m1) # weight1 = 1.2269
  
}
}
\keyword{datasets}
