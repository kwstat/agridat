\name{digby.jointregression}
\alias{digby.jointregression}
\docType{data}
\title{
  Multi-environment trial illustrating joint regression
}
\description{
    Yield of 10 spring wheat varieties for 17 locations in 1976.
}

\format{
  A data frame with 134 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{Genotype factor, 10 levels}
    \item{\code{env}}{Environment factor, 17 levels}
    \item{\code{yield}}{Yield (t/ha)}
  }
}
\details{
  Yield of 10 spring wheat varieties for 17 locations in 1976.

  Used to illustrate modified joint regression.
}
\source{
  Digby, P.G.N. (1979). Modified joint regression analysis for
  incomplete variety x environment data. 
  \emph{Journal of Agricultural Science}, 93, 81-86.
}
\references{
  Hans-Pieter Piepho, 1997.
  Analyzing Genotype-Environment Data by Mixed-Models with
  Multiplicative Terms. \emph{Biometrics}, 53, 761-766.

  RJOINT procedure in GenStat.
  \url{http://www.vsni.co.uk/software/genstat/htmlhelp/server/RJOINT.htm}
}
\examples{
dat <- digby.jointregression

# Simple gen means, ignoring unbalanced data
round(tapply(dat$yield, dat$gen, mean),3)

n.gen <- nlevels(dat$gen)
n.env <- nlevels(dat$env)

# Estimate theta (env eff)
m0 <- lm(yield ~ -1 + env + gen, dat)
thetas <- coef(m0)[1:n.env]
thetas <- thetas-mean(thetas) # center env effects
# Add env effects to the data
dat$theta <- thetas[match(paste("env",dat$env,sep=""), names(thetas))]

# Initialize beta (gen slopes) at 1
betas <- rep(1, n.gen)

done <- FALSE
while(!done){

  betas0 <- betas
  
  # M1: Fix thetas (env effects), estimate beta (gen slope)
  m1 <- lm(yield ~ -1 + gen + gen:theta, data=dat)
  betas <- coef(m1)[-c(1:n.gen)]
  dat$beta <- betas[match(paste("gen",dat$gen,":theta",sep=""), names(betas))]
  # print(betas)
  
  # M2: Fix betas (gen slopes), estimate theta (env slope)
  m2 <- lm(yield ~ env:beta + gen -1, data=dat)
  thetas <- coef(m2)[-c(1:n.gen)]
  thetas[is.na(thetas)] <- 0  # Change last coefficient from NA to 0
  dat$theta <- thetas[match(paste("env",dat$env,":beta",sep=""), names(thetas))]
  print(thetas)

  # Check convergence
  chg <- sum(((betas-betas0)/betas0)^2)
  cat("Relative change in betas",chg,"\n")
  if(chg < .0001) done <- TRUE
  
}

# Dibgy Table 2, modified joint regression

round(betas,3)
# genG01 genG02 genG03 genG04 genG05 genG06 genG07 genG08 genG09 genG10 
#  0.953  0.739  1.082  1.024  1.142  0.877 1.089  0.914  1.196  0.947 

round(thetas,3)+1.164-.515 # re-parameterize to match Digby
# envE01 envE02 envE03 envE04 envE05 envE06 envE07 envE08 envE09 envE10 
# -0.515 -0.578 -0.990 -1.186  1.811  1.696 -1.096  0.046  0.057  0.825 
# envE11 envE12 envE13 envE14 envE15 envE16 envE17 
# -0.576  1.568 -0.779 -0.692  0.836 -1.080  0.649 

}
\keyword{datasets}
