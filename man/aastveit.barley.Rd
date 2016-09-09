\name{aastveit.barley}
\alias{aastveit.barley}
\alias{aastveit.barley.covs}
\alias{aastveit.barley.height}
\docType{data}
\title{
  Barley heights and environmental covariates in Norway
}
\description{
  Average height for 15 genotypes of barley in each of 9 years.
  Also 19 covariates in each of the 9 years.
}

\usage{
data("aastveit.barley.covs")
data("aastveit.barley.height")
}

\format{

  The 'aastveit.barley.covs' dataframe has 9 observations on the following 20 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{R1}}{Avg rainfall (mm/day) in period 1}
    \item{\code{R2}}{Avg rainfall (mm/day) in period 2}
    \item{\code{R3}}{Avg rainfall (mm/day) in period 3}
    \item{\code{R4}}{Avg rainfall (mm/day) in period 4}
    \item{\code{R5}}{Avg rainfall (mm/day) in period 5}
    \item{\code{R6}}{Avg rainfall (mm/day) in period 6}
    \item{\code{S1}}{Daily solar radiation (ca/cm^2) in period 1}
    \item{\code{S2}}{Daily solar radiation (ca/cm^2) in period 2}
    \item{\code{S3}}{Daily solar radiation (ca/cm^2) in period 3}
    \item{\code{S4}}{Daily solar radiation (ca/cm^2) in period 4}
    \item{\code{S5}}{Daily solar radiation (ca/cm^2) in period 5}
    \item{\code{S6}}{Daily solar radiation (ca/cm^2) in period 6}
    \item{\code{ST}}{Sowing date}
    \item{\code{T1}}{Avg temp (deg Celsius) in period 1}
    \item{\code{T2}}{Avg temp (deg Celsius) in period 2}
    \item{\code{T3}}{Avg temp (deg Celsius) in period 3}
    \item{\code{T4}}{Avg temp (deg Celsius) in period 4}
    \item{\code{T5}}{Avg temp (deg Celsius) in period 5}
    \item{\code{T6}}{Avg temp (deg Celsius) in period 6}
    \item{\code{value}}{value of the covariate}
  }

  The 'aastveit.barley.height' dataframe has 135 observations on the
  following 3 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{gen}}{genotype, 15 levels}
    \item{\code{height}}{height (cm)}
  }

}

\details{

  Experiments were conducted at As, Norway.

  The \code{height} dataframe contains average plant height (cm) of 15 varieties
  of barley in each of 9 years.

}

\source{
  Aastveit, A. H. and Martens, H. (1986).
  ANOVA interactions interpreted by partial least squares regression.
  \emph{Biometrics}, 42, 829--844.
  http://doi.org/10.2307/2530697

  Used with permission of Harald Martens.
}
\references{
  J. Chadoeuf and J. B. Denis (1991).
  Asymptotic variances for the multiplicative interaction model.
  \emph{J. App. Stat.} 18, 331--353.
  http://doi.org/10.1080/02664769100000032
}
\examples{

data("aastveit.barley.covs")
data("aastveit.barley.height")

if(require(reshape2) & require(pls)){
  
  # First, PCA of each matrix separately

  Z <- acast(aastveit.barley.height, year ~ gen, value.var="height")
  Z <- sweep(Z, 1, rowMeans(Z))
  Z <- sweep(Z, 2, colMeans(Z)) # Double-centered
  sum(Z^2)*4 # Total SS
  sv <- svd(Z)$d
  round(100 * sv^2/sum(sv^2),1) # Prop of variance each axis
  # Aastveit Figure 1.  PCA of height
  biplot(prcomp(Z),
         main="aastveit.barley - height", cex=0.5)
  
  U <- aastveit.barley.covs
  rownames(U) <- U$year
  U$year <- NULL
  U <- scale(U) # Standardized covariates
  sv <- svd(U)$d
  round(100 * sv^2/sum(sv^2),1) # Prop variance each axis

  \dontrun{
  # Now, PLS relating the two matrices
  m1 <- plsr(Z~U)
  loadings(m1)
  # Aastveit Fig 2a (genotypes), not rotated as they did
  biplot(m1, which="y", var.axes=TRUE)
  # Fig 2b, 2c (not rotated)
  biplot(m1, which="x", var.axes=TRUE)
  }

}

}

