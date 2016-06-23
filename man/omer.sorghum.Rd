\name{omer.sorghum}
\alias{omer.sorghum}
\docType{data}
\title{
  Yield of sorghum in 3 years, 2 locations
}
\description{
  Yield of sorghum in 3 years, 2 locations
}
\usage{data("omer.sorghum")}
\format{
  A data frame with 432 observations on the following 4 variables.
  \describe{
    \item{\code{env}}{environment factor}
    \item{\code{rep}}{replication factor}
    \item{\code{gen}}{genotype factor}
    \item{\code{yield}}{yield, kg/ha}
  }
}
\details{
  Trials were conducted in Sudan, 3 years at 2 locations, 4 reps in RCBD
  at each location.
  
}
\source{

  Siraj Osman Omer, Abdel Wahab Hassan Abdalla, Mohammed Hamza Mohammed, Murari Singh (2015).
  Bayesian estimation of genotype-by-environment interaction in sorghum variety trials 
  \emph{Communications in Biometry and Crop Science}, 10 (2), 82-95.

  Electronic data provided by Siraj Osman Omer.

}

\references{
None.
}

\examples{

data(omer.sorghum)
dat <- omer.sorghum

# REML approach
if(require(lme4) & require(lucid)) {
  
  # 1 loc, 2 years. Match Omer table 1.
  m1 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
             data=subset(dat, is.element(env, c('E2','E4'))))
  vc(m1)
  ##      grp        var1 var2    vcov  sdcor
  ##  gen:env (Intercept) <NA> 17050   130.6 
  ##      gen (Intercept) <NA>  2760    52.54
  ##  env:rep (Intercept) <NA>   959.1  30.97
  ## Residual        <NA> <NA> 43090   207.6 

  # 1 loc, 3 years. Match Omer table 1.
  m2 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
             data=subset(dat, is.element(env, c('E2','E4','E6'))))
  vc(m2)
  ##      grp        var1 var2  vcov  sdcor
  ##  gen:env (Intercept) <NA> 22210 149   
  ##      gen (Intercept) <NA>  9288  96.37
  ##  env:rep (Intercept) <NA>  1332  36.5 
  ## Residual        <NA> <NA> 40270 200.7 
  
  # all 6 locs. Match Omer table 3, frequentist approach
  m3 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
             data=dat)
  vc(m3)
  ##       grp        var1 var2  vcov  sdcor
  ##   gen:env (Intercept) <NA> 21340 146.1 
  ##   env:rep (Intercept) <NA>  1152  33.95
  ##       gen (Intercept) <NA>  1169  34.2 
  ##  Residual        <NA> <NA> 24660 157
  
}

\dontrun{
  # JAGS version
}

}
\keyword{datasets}
