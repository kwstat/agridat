\name{allcroft.lodging}
\alias{allcroft.lodging}
\docType{data}
\title{
  Lodging data from a multi-environment trial cereal crop
}
\description{
  Percent lodging is given for 32 genotypes at 7 environments.
}
\usage{data(allcroft.lodging)}
\format{
  A data frame with 224 observations on the following 3 variables.
  \describe{
    \item{\code{env}}{Factor for environment, 1-7}
    \item{\code{gen}}{Factor for genotype, 1-32}
    \item{\code{y}}{Percent lodged}
  }
}
\details{
  This data is for the first year of a three-year study.
}
\source{
  D. J. Allcroft and C. A. Glasbey, 2003.
  Analysis of crop lodging using a latent variable model.
  \emph{Journal of Agricultural Science}, 140, 383--393.

  Used with permission of Chris Glasbey.
}

\examples{
dat <- allcroft.lodging

# Transformation
dat$sy <- sqrt(dat$y)
# Variety 4 has no lodging anywhere, so add a small amount
dat[dat$env=='E5' & dat$gen=='G04',]$sy <- .01

dotplot(env~y|gen, dat, as.table=TRUE,
xlab="Percent lodged (by genotype)", ylab="Variety",
        main="allcroft.lodging")

\dontrun{
require("Zelig")
# Bayesian tobit model using zelig
m3 <- zelig(sy ~ -1 + gen + env, below=0, above=100, model="tobit.bayes",
            data=dat)
s3 <- summary(m3)
# Average env effect is sum(0+e2+e3+...+e7)/7
avgenv <- apply(m3$coefficients[,33:38], 1, function(x) sum(x)/7)
# Add avgenv to each genotype
p3 <- m3$coefficients[,1:32] + avgenv
# Probability of observing 0.  Compare to Allcroft Table 2,.
round(apply(p3, 2, function(x) mean(x<0)),2)
# Expected squared value of non-zeros.  Somewhat different from Allcroft.
round(apply(p3, 2, function(x) { x <- x[x>0]; mean(x^2) }),2)

# Density plots
plot(p3[,1:4])
}
}

