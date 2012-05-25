\name{cochran.wireworms}
\alias{cochran.wireworms}
\docType{data}
\title{
  Wireworms controlled by fumigants in a latin square
}
\description{
  Wireworms controlled by fumigants in a latin square
}
\usage{data(cochran.wireworms)}
\format{
  A data frame with 25 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{column}}{Column}
    \item{\code{trt}}{Fumigant treatment, 5 levels}
    \item{\code{worms}}{Count of wireworms}
  }
}
\details{
  Plots were approximately 22cm by 13cm.  Layout of the experiment was a
  latin square.  The number of wireworms in each plot was counted,
  following soil fumigation the previous year.
}
\source{
  W. G. Cochran (1938).
  Some difficulties in the statistical analysis of replicated experiments.
  \emph{Empire Journal of Experimental Agriculture}, 6, 157--175.
}
\references{
  G W Snedecor and W G Cochran, 1980. \emph{Statistical Methods},
  Iowa State University Press.  Page 288.
}
\examples{

dat <- cochran.wireworms

# Trt K is effective, but not the others.  Really, this says it all.
bwplot(worms ~ trt, dat)

# Snedecor and Cochran do ANOVA on sqrt(x+1).
dat <- transform(dat, rowf=factor(row), colf=factor(column))
m1 <- aov(sqrt(worms+1) ~ rowf + colf + trt, data=dat)
anova(m1)

# Instead of transforming, use glm
m2 <- glm(worms ~ trt + rowf + colf, data=dat, family="poisson")
anova(m2)

# GLM with random blocking.
require(lme4)
m3 <- lmer(worms ~ -1 + trt + (1|rowf) + (1|colf),
           data=dat, family="poisson")
summary(m3)
}
\keyword{datasets}
