\name{vargas.wheat1}
\alias{vargas.wheat1}
\alias{vargas.wheat1.covs}
\alias{vargas.wheat1.traits}
\docType{data}
\title{
  Wheat yields in 7 years with genetic and environment covariates
}
\description{
  Yield of Durum wheat, 7 genotypes, 6 years, with 16 genotypic variates
  and 16 environment variates.
}

\usage{
data("vargas.wheat1.covs")
data("vargas.wheat1.traits")
}

\format{

  The \code{vargas.wheat1.covs} dataframe has 6 observations on the following 17 variables.
  \describe{
    \item{\code{year}}{year, 1990-1995}
    \item{\code{MTD}}{Mean daily max temperature December, deg C}
    \item{\code{MTJ}}{January}
    \item{\code{MTF}}{February}
    \item{\code{MTM}}{March}
    \item{\code{mTD}}{Mean daily minimum temperature December, deg C}
    \item{\code{mTJ}}{January}
    \item{\code{mTF}}{February}
    \item{\code{mTM}}{March}
    \item{\code{PRD}}{Monthly precipitation in December, mm}
    \item{\code{PRJ}}{January}
    \item{\code{PRF}}{February}
    \item{\code{PRM}}{March}
    \item{\code{SHD}}{{a numeric vector}}
    \item{\code{SHJ}}{January}
    \item{\code{SHF}}{February}
    \item{\code{SHM}}{March}
  }

  The \code{vargas.wheat1.traits} dataframe has 126 observations on the following 19 variables.
  \describe{
    \item{\code{year}}{year, 1990-1995}
    \item{\code{rep}}{replicate, 3 levels}
    \item{\code{gen}}{genotype, 7 levels}
    \item{\code{yield}}{yield, kg/ha}
    \item{\code{ANT}}{anthesis, days after emergence}
    \item{\code{MAT}}{maturity, days after emergence}
    \item{\code{GFI}}{grainfill, MAT-ANT}
    \item{\code{PLH}}{plant height, cm}
    \item{\code{BIO}}{biomass above ground, kg/ha}
    \item{\code{HID}}{harvest index}
    \item{\code{STW}}{straw yield, kg/ha}
    \item{\code{NSM}}{spikes / m^2}
    \item{\code{NGM}}{grains / m^2}
    \item{\code{NGS}}{grains per spike}
    \item{\code{TKW}}{thousand kernel weight, g}
    \item{\code{WTI}}{weight per tiller, g}
    \item{\code{SGW}}{spike grain weight, g}
    \item{\code{VGR}}{vegetative growth rate, kg/ha/day, STW/ANT}
    \item{\code{KGR}}{kernel growth rate, mg/kernel/day}

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
  https://doi.org/10.2135/cropsci1998.0011183X003800030010x
  
  Data provided by Jose Crossa.
}

\examples{

library(agridat)

\dontrun{

  data(vargas.wheat1.covs)
  data(vargas.wheat1.traits)

  libs(pls)
  libs(reshape2)
  
  # Yield as a function of non-yield traits
  Y0 <- vargas.wheat1.traits[,c('gen','rep','year','yield')]
  Y0 <- acast(Y0, gen ~ year, value.var='yield', fun=mean)
  Y0 <- sweep(Y0, 1, rowMeans(Y0))
  Y0 <- sweep(Y0, 2, colMeans(Y0)) # GxE residuals
  Y1 <- scale(Y0) # scaled columns
  X1 <- vargas.wheat1.traits[, -4] # omit yield
  X1 <- aggregate(cbind(ANT,MAT,GFI,PLH,BIO,HID,STW,NSM,NGM,
                        NGS,TKW,WTI,SGW,VGR,KGR) ~ gen, data=X1, FUN=mean)
  rownames(X1) <- X1$gen
  X1$gen <- NULL
  X1 <- scale(X1) # scaled columns
  m1 <- plsr(Y1~X1)
  loadings(m1)[,1,drop=FALSE] # X loadings in Table 1 of Vargas

  biplot(m1, cex=.5, which="x", var.axes=TRUE,
         main="vargas.wheat1 - gen ~ trait") # Vargas figure 2a

  # Yield as a function of environment covariates
  Y2 <- t(Y0)
  X2 <- vargas.wheat1.covs
  rownames(X2) <- X2$year
  X2$year <- NULL
  Y2 <- scale(Y2)
  X2 <- scale(X2)
  
  m2 <- plsr(Y2~X2)
  loadings(m2)[,1,drop=FALSE] # X loadings in Table 2 of Vargas
}
}

