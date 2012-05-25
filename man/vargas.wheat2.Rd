\name{vargas.wheat2}
\alias{vargas.wheat2}
\docType{data}
\title{
  Wheat yields for a multi-environment trial and environmental covariates
}
\description{
  The yield of 8 wheat genotypes was measured in 21 low-humidity
  environments.  Each environment had 13 covariates recorded.
}
\usage{vargas.wheat2}
\format{
  A list of two matrices, \code{yield} and \code{covs}.
  See below.
}
\details{
  The \code{yield} matrix contains grain yields (kg/ha) for 8 wheat
  genotypes at 21 low-humidity environments grown during 1990-1994.
  The matrix is double-centered so that the rows and columns have mean zero.
  The locations of the experiments were:
  \tabular{ll}{
    OBD \tab Ciudad Obregon, Mexico, planted in December \cr
    SUD \tab Wad Medani, Sudan \cr
    TLD \tab Tlaltizapan, Mexico, planted in December \cr
    TLF \tab Tlaltizapan, Mexico, planted in February \cr
    IND \tab Dharwar,  India \cr
    SYR \tab Aleppo, Syria \cr
    NIG \tab Kadawa, Nigeria \cr
  }

  The \code{covs} matrix has values of 13 covariates at the same 21
  environments. The covariates are:
  \tabular{ll}{
    CYC \tab length of growth cycle in days \cr
    mTC \tab mean daily minimum temperature in degrees Celsius \cr
    MTC \tab mean daily maximum temperature \cr
    SHC \tab sun hours per day \cr
    mTV \tab mean daily minimum temp during vegetative stage \cr
    MTV \tab mean daily maximum temp during vegetative stage \cr
    SHV \tab sun hours per day during vegetative stage \cr
    mTS \tab mean daily minimum temp during spike growth stage \cr
    MTS \tab mean daily maximum temp during spike growth stage \cr
    SHS \tab sun hours per day during spike growth stage \cr
    mTG \tab mean daily minimum temp during grainfill stage \cr
    MTG \tab mean daily maximum temp during grainfill stage \cr
    SHG \tab sun hours per day during grainfill stage \cr
  }
}
\source{
  Mateo Vargas and Jose Crossa and Ken Sayre and Matthew Renolds and
  Martha E Ramirez and Mike Talbot, 1998.
  Interpreting Genotype x Environment Interaction in Wheat by
  Partial Least Squares Regression, \emph{Crop Science}, 38, 679--689.

  Data kindly provided by Jose Crossa.
}
\examples{
\dontrun{
dat <- vargas.wheat2
yield <- dat$yield
covs <- dat$covs

# The pls package centers, but does not (by default) use scaled covariates
# Vargas says you should
# yield <- scale(yield)
covs <- scale(covs)

require(pls)
m2 <- plsr(yield ~ covs)

# Plot predicted vs observed for each genotype using all components
plot(m2)

# Loadings
plot(m2, "loadings", xaxt='n')
axis(1, at=1:ncol(covs), labels=colnames(covs), las=2)

# Biplots
biplot(m2, cex=.5, which="y", var.axes=TRUE) # Vargas figure 2a
biplot(m2, cex=.5, which="x", var.axes=TRUE) # Vectors form figure 2 b
biplot(m2, cex=.5, which="scores", var.axes=TRUE)
biplot(m2, cex=.5, which="loadings", var.axes=TRUE)
}
}

