\name{ortiz.tomato}
\alias{ortiz.tomato}
\docType{data}
\title{
  Tomato weight/yield and environmental covariates in Latin America
}
\description{
  Tomato weight/yield and environmental covariates in Latin America
}
\usage{data(ortiz.tomato)}
\format{
  A list of three matrices, \code{yield}, \code{weight}, and \code{covs}.
  See details below.
}
\details{

  The \code{yield} matrix contains average marketable fruit yield (t /
  ha) for 8 open-pollinated and 7 hybrid tomatos in 18 environments.
  The \code{weight} matrix contains average fruit weight (g).

  The environment locations and codes are:
  Estanzuela, Guatemala (E04), Baja Verapaz, Guatemala, (E05),
  Cogutepeque, El Salvador (E06), San Andres, El Salvador (E07),
  Comayagua, Honduras (E11), Valle de Sabaco, Nicaragua (E14),
  San Antonio de Belen, Costa Rica (E15),
  San Cristobal, Dominican Republic (E20),
  Constanza, Dominican Republic (E21), Palmira, Colombia (E27),
  La Molina, Peru (E40), Santiago, Chile (E41),
  Chillan, Chile (E42), Curacavi, Chile (E43), Colina, Chile (44),
  Belem, Brazil (E50), Caacupe, Paraguay (E51),
  Centeno, Trinidad Tobago (E53).
  
  The \code{covs} matrix contains 16 environmental covariates.
  \tabular{ll}{
  Lat  \tab Latitude \cr
  Long \tab Longitude \cr
  MxT  \tab Max temperature (C) \cr
  MnT  \tab Min temperature (C) \cr
  MeT  \tab Mean temperature (C) \cr
  Prec \tab Precipitation (mm) \cr
  Day  \tab Degree days (base 10) \cr
  pH   \tab Soil pH \cr
  OM   \tab Organic matter (percent) \cr
  P    \tab Phosphorous (ppm) \cr
  K    \tab Potassium (me/100 g) \cr
  ExN  \tab Extra nitrogen (kg / ha) \cr
  ExP  \tab Extra phosphorous (kg / ha) \cr
  ExK  \tab Extra potassium (kg / ha) \cr
  Trim \tab Trimming (0/1) \cr
  Driv \tab Drivings (0/1) \cr
  Irr  \tab Irrigation (0/1) \cr
  Dha  \tab Days to harvest \cr
}
}

\source{
  Rodomiro Ortiz and Jose Crossa and Mateo Vargas and Juan Izquierdo, 2007.
  Studying the Effect of Environmental Variables On the Genotype x
  Environment Interaction of Tomato. \emph{Euphytica}, 153, 119--134.

  Used with permission of Rodomiro Ortiz.
}
\examples{

\dontrun{

# Double-centered yield matrix
Y <- ortiz.tomato$yield
Y <- sweep(Y, 1, rowMeans(Y, na.rm=TRUE))
Y <- sweep(Y, 2, colMeans(Y, na.rm=TRUE))

# Standardized covariates
X <- ortiz.tomato$covs
X <- X[,c("MxT","MnT","MeT","Prec","Day","pH","OM","P","K","ExN","ExP","ExK","Trim","Driv","Irr","Dha")] 
X <- scale(X)

# Now, PLS relating the two matrices
require(pls)
m1 <- plsr(Y~X)
# Inner-product relationships similar to Ortiz figure 1.
biplot(m1, which="x", var.axes=TRUE)
biplot(m1, which="y", var.axes=TRUE)

}

}
\keyword{datasets}
