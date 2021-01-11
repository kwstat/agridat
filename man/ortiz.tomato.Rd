\name{ortiz.tomato}
\alias{ortiz.tomato}
\alias{ortiz.tomato.covs}
\alias{ortiz.tomato.yield}
\docType{data}
\title{
  Multi-environment trial of tomato in Latin America, weight/yield and environmental covariates
}
\description{
  Multi-environment trial of tomato in Latin America, weight/yield and environmental covariates
}

\usage{
  data("ortiz.tomato.covs")
  data("ortiz.tomato.yield")
}

\format{

  The \code{ortiz.tomato.covs} data frame has 18 observations on the following 18 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{Day}}{degree days (base 10)}
    \item{\code{Dha}}{days to harvest}
    \item{\code{Driv}}{drivings (0/1)}
    \item{\code{ExK}}{extra potassium (kg / ha)}
    \item{\code{ExN}}{extra nitrogen (kg / ha)}
    \item{\code{ExP}}{extra phosphorous (kg / ha)}
    \item{\code{Irr}}{irrigation (0/1)}
    \item{\code{K  }}{potassium (me/100 g)}
    \item{\code{Lat}}{latitude}
    \item{\code{Long}}{longitude}
    \item{\code{MeT}}{mean temperature (C)}
    \item{\code{MnT}}{min temperature (C)}
    \item{\code{MxT}}{max temperature (C)}
    \item{\code{OM }}{organic matter (percent)}
    \item{\code{P  }}{phosphorous (ppm)}
    \item{\code{pH }}{soil pH}
    \item{\code{Prec}}{precipitation (mm)}
    \item{\code{Tri}}{trimming (0/1)}
  }
  
  The \code{ortiz.tomato.yield} data frame has 270 observations on the following 4 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{marketable fruit yield t/ha}
    \item{\code{weight}}{fruit weight, g}
  }

}

\details{

  The environment locations are:
  \tabular{ll}{
    E04 \tab Estanzuela, Guatemala \cr
    E05 \tab Baja Verapaz, Guatemala \cr
    E06 \tab Cogutepeque, El Salvador \cr
    E07 \tab San Andres, El Salvador \cr
    E11 \tab Comayagua, Honduras \cr
    E14 \tab Valle de Sabaco, Nicaragua \cr
    E15 \tab San Antonio de Belen, Costa Rica \cr
    E20 \tab San Cristobal, Dominican Republic \cr
    E21 \tab Constanza, Dominican Republic \cr
    E27 \tab Palmira, Colombia \cr
    E40 \tab La Molina, Peru \cr
    E41 \tab Santiago, Chile \cr
    E42 \tab Chillan, Chile \cr
    E43 \tab Curacavi, Chile \cr
    E44 \tab Colina, Chile \cr
    E50 \tab Belem, Brazil \cr
    E51 \tab Caacupe, Paraguay \cr
    E53 \tab Centeno, Trinidad Tobago\cr
  }
  
  
  Used with permission of Rodomiro Ortiz.
}

\source{
  Rodomiro Ortiz and Jose Crossa and Mateo Vargas and Juan Izquierdo, 2007.
  Studying the Effect of Environmental Variables On the Genotype x
  Environment Interaction of Tomato.
  Euphytica, 153, 119--134.
  https://doi.org/10.1007/s10681-006-9248-7
}

\examples{
\dontrun{

library(agridat)
data(ortiz.tomato.covs)
data(ortiz.tomato.yield)

libs(pls, reshape2)
# Double-centered yield matrix
Y <- acast(ortiz.tomato.yield, env ~ gen, value.var='yield')
Y <- sweep(Y, 1, rowMeans(Y, na.rm=TRUE))
Y <- sweep(Y, 2, colMeans(Y, na.rm=TRUE))

# Standardized covariates
X <- ortiz.tomato.covs
rownames(X) <- X$env
X <- X[,c("MxT", "MnT", "MeT", "Prec", "Day", "pH", "OM", "P", "K",
          "ExN", "ExP", "ExK", "Trim", "Driv", "Irr", "Dha")]
X <- scale(X)

# Now, PLS relating the two matrices.
# Note: plsr deletes observations with missing values

m1 <- plsr(Y~X)
# Inner-product relationships similar to Ortiz figure 1.
biplot(m1, which="x", var.axes=TRUE, main="ortiz.tomato - env*cov biplot")
#biplot(m1, which="y", var.axes=TRUE)
}
}
\keyword{datasets}
