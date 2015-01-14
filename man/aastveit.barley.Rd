\name{aastveit.barley}
\alias{aastveit.barley}
\docType{data}
\title{
  Barley heights and environmental covariates in Norway
}
\description{
  Average height for 15 genotypes of barley in each of 9 years.  A
  second matrix contains 19 covariates in each of 9 years.
}

\format{
  A list of two matrices, \code{height} and \code{covs}.
  See details below.
}
\details{
  Experiments were conducted at As, Norway.

  The \code{height} matrix contains average plant height (cm) of 15 varieties
  of barley in each of 9 years.

  The \code{covs} matrix contains 19 environmental covariates
  for each year.
  \tabular{ll}{
    ST    \tab Sowing date \cr
    T1-T6 \tab Avg temp (deg Celsius) in period 1, ..., 6 \cr
    R1-R6 \tab Avg rainfall (mm/day) in period 1, ..., 6 \cr
    S1-S6 \tab Daily solar radiation (ca/cm^2) in period 1, ..., 6 \cr
  }
}
\source{
  Aastveit, A. H. and Martens, H. (1986).
  ANOVA interactions interpreted by partial least squares regression.
  \emph{Biometrics}, 42, 829--844.

  Used with permission of Harald Martens.
}
\references{
  Chadoeuf, J and Denis, J B (1991).
  Asymptotic variances for the multiplicative interaction model.
  \emph{J. App. Stat.} 18, 331--353.
}
\examples{

data(aastveit.barley)

# First, PCA of each matrix separately

Z <- aastveit.barley$height
Z <- sweep(Z, 1, rowMeans(Z))
Z <- sweep(Z, 2, colMeans(Z)) # Double-centered
sum(Z^2)*4 # Total SS
sv <- svd(Z)$d
round(100 * sv^2/sum(sv^2),1) # Prop of variance each axis
# Aastveit Figure 1.  PCA of height
biplot(prcomp(Z), main="aastveit.barley - height")

U <- aastveit.barley$covs
U <- scale(U) # Standardized covariates
sv <- svd(U)$d
round(100 * sv^2/sum(sv^2),1) # Prop variance each axis

# Now, PLS relating the two matrices
if(require(pls)){
m1 <- plsr(Z~U)
loadings(m1)
# Aastveit Fig 2a (genotypes), not rotated as they did
biplot(m1, which="y", var.axes=TRUE)
# Fig 2b, 2c (not rotated)
biplot(m1, which="x", var.axes=TRUE)
}

}

