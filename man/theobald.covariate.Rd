\name{theobald.covariate}
\alias{theobald.covariate}
\docType{data}
\title{
  Silage yields for Year * Loc * Variety with covariate
}
\description{
  Silage yields for maize in 5 years at 7 districts for 10 hybrids.
}

\format{
  A data frame with 256 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{Year, 1990-1994}
    \item{\code{env}}{Environment/District, 1-7}
    \item{\code{gen}}{Genotype factor, 1-10}
    \item{\code{yield}}{Dry-matter silage yield for corn}
    \item{\code{chu}}{Corn Heat Units}
  }
}
\details{
  The trials were carried out in seven districts in the maritime
  provinces of Eastern Canada.
  Different fields were used in successive years.
  The covariate CHU (Corn Heat Units) is the accumulated average daily
  temperatures (thousands of degrees Celsius) during the growing season
  at each location.

  Thanks to Chris Theobald for permission to use the data and for BUGS code.
}
\source{
  Chris M. Theobald and Mike Talbot and Fabian Nabugoomu, 2002.
  A Bayesian Approach to Regional and Local-Area Prediction From Crop
  Variety Trials, \emph{Journ Agric Biol Env Sciences}, 7, 403--419.
}

\examples{

dat <- theobald.covariate

# REML estimates (Means) in table 3 of Theobald 2002
if(require(lme4)){
dat <- transform(dat, year=factor(year))
m0 <- lmer(yield ~ -1 + gen + (1|year/env) + (1|gen:year), data=dat)
round(fixef(m0),2)
}

\dontrun{

# Use JAGS to fit Theobald (2002) model 3.2 with 'Expert' prior

require(reshape2)
ymat <- acast(dat, year+env~gen, value.var='yield')
chu <- acast(dat, year+env~., mean, value.var='chu', na.rm=TRUE)
chu <- as.vector(chu - mean(chu))  # Center the covariate
dat$yr <- as.numeric(dat$year)
yridx <- as.vector(acast(dat, year+env~., mean, value.var='yr', na.rm=TRUE))
dat$loc <- as.numeric(dat$env)
locidx <- acast(dat, year+env~., mean, value.var='loc', na.rm=TRUE)
locidx <- as.vector(locidx)

jdat <- list(nVar = 10, nYear = 5, nLoc = 7, nYL = 29, yield = ymat,
            chu = chu, year = yridx, loc = locidx)

require(rjags)
m1 <- jags.model(file=system.file("/files/theobald.bug", package="agridat"),
  data=jdat, n.chains=2)

# Table 3, Variety deviations from means (Expert prior)
c1 <- coda.samples(m1, variable.names=(c('alpha')),
                   n.iter=10000, thin=10)
s1 <- summary(c1)
effs <- s1$statistics[,'Mean']
rev(sort(round(effs - mean(effs), 2))) # Perfect match (different order?)
}

}

