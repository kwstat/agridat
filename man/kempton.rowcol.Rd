\name{kempton.rowcol}
\alias{kempton.rowcol}
\docType{data}
\title{
  Wheat row-column experiment
}
\description{
  Wheat yields of 35 genotypes, 2 reps, planted in a row-column
  design. Two plots are missing.
}

\format{
  A data frame with 68 observations on the following 5 variables.
  \describe{
    \item{\code{rep}}{replicate factor, 2 levels}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype factor, 35 levels}
    \item{\code{yield}}{yield}
  }
}
\details{
  Included to illustrate REML analysis of a row-column design.
}
\source{
  R A Kempton and P N Fox,
  \emph{Statistical Methods for Plant Variety Evaluation},
  Chapman and Hall, 1997.
}

\examples{

data(kempton.rowcol)
dat <- kempton.rowcol
dat <- transform(dat, rowf=factor(row), colf=factor(col))

if(require(desplot)){
  desplot(yield~col*row|rep, dat,
          num=gen, out1=rep, # unknown aspect
          main="kempton.rowcol")
}


# Model with rep, row, col as random.  Kempton, page 62.
# Use "-1" so that the vcov matrix doesn't include intercept
if(require(lme4)){
m1 <- lmer(yield ~ -1 + gen + rep + (1|rep:rowf) + (1|rep:colf), data=dat)

# Variance components match Kempton.
print(m1, corr=FALSE)

# Standard error of difference for genotypes.  Kempton page 62, bottom.
covs <- as.matrix(vcov(m1)[1:35, 1:35])
vars <- diag(covs)
vdiff <- outer(vars, vars, "+") - 2 * covs
sed <- sqrt(vdiff[upper.tri(vdiff)])
min(sed) # Minimum SED
mean(sed) # Average SED
max(sed) # Maximum SED
}
}
