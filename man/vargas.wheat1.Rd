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
  \describe{
    \item{\code{year}}{Year, 1990-1995}
    \item{\code{rep}}{Replicate factor, 3 levels}
    \item{\code{gen}}{Genotype factor, 7 levels}
    \item{\code{yield}}{Yield, kg/ha}
    \item{\code{ANT}}{Anthesis, days after emergence}
    \item{\code{MAT}}{Maturity, days after emergence}
    \item{\code{GFI}}{Grainfill, MAT-ANT}
    \item{\code{PLH}}{Plant height, cm}
    \item{\code{BIO}}{Biomass above ground, kg/ha}
    \item{\code{HID}}{Harvest index}
    \item{\code{STW}}{Straw yield, kg/ha}
    \item{\code{NSM}}{Spikes / m^2}
    \item{\code{NGM}}{Grains / m^2}
    \item{\code{NGS}}{Grains per spike}
    \item{\code{TKW}}{Thousand kernel weight, g}
    \item{\code{WTI}}{Weight per tiller, g}
    \item{\code{SGW}}{Spike grain weight, g}
    \item{\code{VGR}}{Vegetative growth rate, kg/ha/day, STW/ANT}
    \item{\code{KGR}}{Kernel growth rate, mg/kernel/day}
  }

  The \code{envals} data frame has 17 variables for each of 6 years:
  \describe{
    \item{\code{year}}{Year, 1990-1995}
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
    \item{\code{SHD}}{Sun hours per day December}
    \item{\code{SHJ}}{Sun hours per day January}
    \item{\code{SHF}}{Sun hours per day February}
    \item{\code{SHM}}{Sun hours per day March}
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

