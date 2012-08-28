\name{crowder.seeds}
\alias{crowder.seeds}
\docType{data}
\title{
  Germination of Orobanche seeds from Crowder (1978)
}
\description{
  Number of Orobanche seeds tested/germinated for two genotypes and
  two treatments.
}
\usage{data(crowder.seeds)}
\format{
  \describe{
    \item{\code{plate}}{Factor for replication}
    \item{\code{gen}}{Factor for genotype with levels \code{O73}, \code{O75}}
    \item{\code{extract}}{Factor for extract from \code{bean}, \code{cucumber}}
    \item{\code{germ}}{Number of seeds that germinated}
    \item{\code{n}}{Total number of seeds tested}
  }
}
\details{
  Orobanche aegyptiaca (commonly known as Egyptian broomrape) is a
  parasitic plant family.
  The plants have no chlorophyll and grow on the roots of other plants.
  The seeds remain dormant in soil until certain compounds from
  living plants stimulate germination.
  Two genotypes were studied in the experiment, \emph{O. aegyptiaca 73} and
  \emph{O. aegyptiaca 75}.  The seeds were brushed with one of two extracts
  prepared from either a bean plant or cucmber plant.
  The experimental design was a 2x2 factorial, each with 5 or 6 reps of plates.
}
\source{
  Crowder, M.J., 1978. Beta-binomial anova for proportions.
  \emph{Appl. Statist.}, 27, 34-37.
}
\references{
  N. E. Breslow and D. G. Clayton. 1993.
  Approximate inference in generalized linear mixed models.
  \emph{Journal of the American Statistical Association}, 88:9-25.

  Y. Lee and J. A. Nelder. 1996.
  Hierarchical generalized linear models with discussion.
  \emph{J. R. Statist. Soc. B}, 58:619-678.
}
\examples{
dat <- crowder.seeds
m1.glm <- m1.glmm <- m1.bb <- m1.hglm <- NA

# Graphic
require(lattice)
dotplot(germ/n~gen|extract, dat)

# GLM
m1.glm <- glm(cbind(germ,n-germ) ~ gen*extract,
   data=dat, family=quasibinomial())
summary(m1.glm)

# GLMM.  Assumes Gaussian random effects
library(MASS)
m1.glmm <- glmmPQL(cbind(germ, n-germ) ~ gen*extract, random= ~1|plate,
  family=binomial(), data=dat)
summary(m1.glmm)

# AOD package
if(require(aod)){
  m1.bb <- betabin(cbind(germ, n - germ) ~ gen * extract, ~ 1, data = dat)
  summary(m1.bb)
}

# HGML package. Beta-binomial with beta-distributed random effects
if(require(hglm)){
  m1.hglm <- hglm(fixed= germ/n ~ I(gen=="O75")*extract, weights=n, data=dat,
                  random=~1|plate, family=binomial(), rand.family=Beta(),
                  fix.disp=1)
}

# Compare coefficients
round(summary(m1.glm)$coef,2)
round(summary(m1.glmm)$tTable,2)
round(summary(m1.bb)@Coef,2)
round(summary(m1.hglm)$FixCoefMat,2)

\dontrun{
# JAGS/BUGS.  See http://mathstat.helsinki.fi/openbugs/Examples/Seeds.html
# Germination rate depends on p, which is a logit of a linear predictor
# based on genotype and extract, plus random deviation to intercept
require("rjags")

# To match the output on the BUGS web page, use: dat$gen=="O73".
# We use dat$gen=="O75" to compare with the parameterization above.
jdat =list(germ = dat$germ, n = dat$n,
           root = as.numeric(dat$extract=="cucumber"),
           gen = as.numeric(dat$gen=="O75"),
           nobs = nrow(dat))

jinit = list(int = 0, genO75 = 0, extcuke = 0, g75ecuke = 0, tau = 10)

# Unlike BUGS, we use names THAT WE CAN ACTUALLY INTERPRET!
mod.bug = "
model {
  for(i in 1:nobs) {
    germ[i] ~ dbin(p[i], n[i])
    b[i] ~ dnorm(0.0, tau)
    logit(p[i]) <- int + genO75 * gen[i] + extcuke * root[i] +
                   g75ecuke * gen[i] * root[i] + b[i]
  }
  int ~ dnorm(0.0, 1.0E-6)
  genO75 ~ dnorm(0.0, 1.0E-6)
  extcuke ~ dnorm(0.0, 1.0E-6)
  g75ecuke ~ dnorm(0.0, 1.0E-6)
  tau ~ dgamma(0.001, 0.001)
  sigma <- 1 / sqrt(tau)
}"

j1 <- jags.model(textConnection(mod.bug), data=jdat, inits=jinit, n.chains=1)

c1 <- coda.samples(j1, c("int","genO75","g75ecuke","extcuke","sigma"),
                   n.iter=20000)
summary(c1)
# Medians are very similar to estimates from hglm
# round(summary(m1.hglm)$FixCoefMat,2)

# Plot observed data with HPD intervals for germination probability
c2 <- coda.samples(j1, c("p"), n.iter=20000)
hpd <- HPDinterval(c2)[[1]]
med <- summary(c2, quantiles=.5)$quantiles
fit <- data.frame(med, hpd)

require("latticeExtra")
obs <- dotplot(1:21 ~ germ/n, dat, ylab="plate",
               col=as.numeric(dat$gen), pch=substring(dat$extract,1))
obs + segplot(1:21 ~ lower + upper, data=fit, centers=med)

}
}

