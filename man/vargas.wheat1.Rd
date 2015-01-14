\name{vargas.wheat1}
\alias{vargas.wheat1}
\docType{data}
\title{
  Durum wheat yields in 7 years with genetic and environment covariates
}
\description{
  Yield of Durum wheat, 7 genotypes, 6 years, with 16 genotypic variates
  and 16 environment variates.
}

\format{
  A list of two data frames, \code{genvals} and \code{envvals}.

  The \code{genvals} data frame contains 126 observations of genetic
  variables for each year*rep*gen:
  \tabular{ll}{
    year \tab Year, 1990-1995 \cr
    rep \tab Replicate factor, 3 levels \cr
    gen \tab Genotype factor, 7 levels \cr
    yield \tab Yield, kg/ha \cr
    ANT \tab Anthesis, days after emergence \cr
    MAT \tab Maturity, days after emergence \cr
    GFI \tab Grainfill, MAT-ANT \cr
    PLH \tab Plant height, cm \cr
    BIO \tab Biomass above ground, kg/ha \cr
    HID \tab Harvest index \cr
    STW \tab Straw yield, kg/ha \cr
    NSM \tab Spikes / m^2 \cr
    NGM \tab Grains / m^2 \cr
    NGS \tab Grains per spike \cr
    TKW \tab Thousand kernel weight, g \cr
    WTI \tab Weight per tiller, g \cr
    SGW \tab Spike grain weight, g \cr
    VGR \tab Vegetative growth rate, kg/ha/day, STW/ANT \cr
    KGR \tab Kernel growth rate, mg/kernel/day \cr
  }

  The \code{envals} data frame has 17 variables for each of 6 years:
  \tabular{ll}{
    year \tab Year, 1990-1995 \cr
    MTD \tab Mean daily max temperature December, deg C \cr
    MTJ \tab January \cr
    MTF \tab February \cr
    MTM \tab March \cr
    mTD \tab Mean daily minimum temperature December, deg C \cr
    mTJ \tab January \cr
    mTF \tab February \cr
    mTM \tab March \cr
    PRD \tab Monthly precipitation in December, mm \cr
    PRJ \tab January \cr
    PRF \tab February \cr
    PRM \tab March \cr
    SHD \tab Sun hours per day December \cr
    SHJ \tab Sun hours per day January \cr
    SHF \tab Sun hours per day February \cr
    SHM \tab Sun hours per day March \cr
  }
}

\details{
  Conducted in Ciudad Obregon, Mexico.
}
\source{
  Mateo Vargas and Jose Crossa and Ken Sayre and Matthew Renolds and
  Martha E Ramirez and Mike Talbot, 1998.
  Interpreting Genotype x Environment Interaction in Wheat by
  Partial Least Squares Regression, \emph{Crop Science}, 38, 679--689.

  Data kindly provided by Jose Crossa.
}

\examples{

data(vargas.wheat1)

\dontrun{
gvals <- vargas.wheat1$genvals
evals <- vargas.wheat1$envvals

require(pls)

# Yield as a function of gen variates
require(reshape2)
gv <- melt(gvals, id.var=c('gen','rep','year'))
Y0 <- subset(gv, variable=="yield")
Y0 <- acast(Y0, gen~year, mean)
Y0 <- sweep(Y0, 1, rowMeans(Y0))
Y0 <- sweep(Y0, 2, colMeans(Y0)) # GxE residuals
Y1 <- scale(Y0) # scaled columns
X1 <- subset(gv, variable!="yield")
X1 <- acast(X1, gen~variable, mean)
X1 <- scale(X1) # scaled columns
m1 <- plsr(Y1~X1)
loadings(m1)[,1,drop=FALSE] # X loadings in Table 1 of Vargas

biplot(m1, cex=.5, which="x", var.axes=TRUE,
       main="vargas.wheat1 - gen ~ trait") # Vargas figure 2a

# Yield as a function of env variates
Y2 <- t(Y0)
X2 <- vargas.wheat1$envvals
rownames(X2) <- X2$year
X2 <- as.matrix(X2[,-1])
Y2 <- scale(Y2)
X2 <- scale(X2)

m2 <- plsr(Y2~X2)
loadings(m2)[,1,drop=FALSE] # X loadings in Table 2 of Vargas
}
}

