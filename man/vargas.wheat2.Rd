\name{vargas.wheat2}
\alias{vargas.wheat2}
\alias{vargas.wheat2.covs}
\alias{vargas.wheat2.yield}

\docType{data}
\title{
  Multi-environment trial of wheat with environmental covariates
}
\description{
  The yield of 8 wheat genotypes was measured in 21 low-humidity
  environments.  Each environment had 13 covariates recorded.
}

\usage{
data("vargas.wheat2.covs")
data("vargas.wheat2.yield")
}

\format{

  The 'vargas.wheat2.covs' data frame has 21 observations on the following 14 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{CYC}}{length of growth cycle in days}
    \item{\code{mTC}}{mean daily minimum temperature in degrees Celsius}
    \item{\code{MTC}}{mean daily maximum temperature}
    \item{\code{SHC}}{sun hours per day}
    \item{\code{mTV}}{mean daily minimum temp during vegetative stage}
    \item{\code{MTV}}{mean daily maximum temp during vegetative stage}
    \item{\code{SHV}}{sun hours per day during vegetative stage}
    \item{\code{mTS}}{mean daily minimum temp during spike growth stage}
    \item{\code{MTS}}{mean daily maximum temp during spike growth stage}
    \item{\code{SHS}}{sun hours per day during spike growth stage}
    \item{\code{mTG}}{mean daily minimum temp during grainfill stage}
    \item{\code{MTG}}{mean daily maximum temp during grainfill stage}
    \item{\code{SHG}}{sun hours per day during grainfill stage}
  }

  The 'vargas.wheat2.yield' data frame has 168 observations on the following 3 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{yield (kg/ha)}
  }
  
}

\details{

  Grain yields (kg/ha) for 8 wheat genotypes at 21 low-humidity
  environments grown during 1990-1994. The data is environment-centered
  and genotype-centered. The rows and columns of the GxE matrix have
  mean zero. The locations of the experiments were:
  \tabular{ll}{
    OBD \tab Ciudad Obregon, Mexico, planted in December \cr
    SUD \tab Wad Medani, Sudan \cr
    TLD \tab Tlaltizapan, Mexico, planted in December \cr
    TLF \tab Tlaltizapan, Mexico, planted in February \cr
    IND \tab Dharwar,  India \cr
    SYR \tab Aleppo, Syria \cr
    NIG \tab Kadawa, Nigeria \cr
  }

}

\source{
  
  Mateo Vargas and Jose Crossa and Ken Sayre and Matthew Renolds and
  Martha E Ramirez and Mike Talbot, 1998.
  Interpreting Genotype x Environment Interaction in Wheat by
  Partial Least Squares Regression, \emph{Crop Science}, 38, 679--689.
  http://doi.org/10.2135/cropsci1998.0011183X003800030010x
  
  Data provided by Jose Crossa.
}

\examples{

if(require(pls) & require(reshape2)){
  
  data(vargas.wheat2.covs)
  datc <- vargas.wheat2.covs

  data(vargas.wheat2.yield)
  daty <- vargas.wheat2.yield

  # Cast to matrix
  daty <- acast(daty, env ~ gen, value.var='yield')
  rownames(datc) <- datc$env
  datc$env <- NULL
  
  # The pls package centers, but does not (by default) use scaled covariates
  # Vargas says you should
  # daty <- scale(daty)
  datc <- scale(datc)

  m2 <- plsr(daty ~ datc)

  # Plot predicted vs observed for each genotype using all components
  plot(m2)

  # Loadings
  # plot(m2, "loadings", xaxt='n')
  # axis(1, at=1:ncol(datc), labels=colnames(datc), las=2)

  # Biplots
  biplot(m2, cex=.5, which="y", var.axes=TRUE,
         main="vargas.wheat2 - daty ~ datc") # Vargas figure 2a
  biplot(m2, cex=.5, which="x", var.axes=TRUE) # Vectors form figure 2 b
  # biplot(m2, cex=.5, which="scores", var.axes=TRUE)
  # biplot(m2, cex=.5, which="loadings", var.axes=TRUE)
}

}
