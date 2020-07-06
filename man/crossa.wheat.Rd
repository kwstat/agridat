\name{crossa.wheat}
\alias{crossa.wheat}
\docType{data}
\title{
  Multi-environment trial of wheat for 18 genotypes at 25 locations
}
\description{
  Wheat yields for 18 genotypes at 25 locations
}

\format{
  A data frame with 450 observations on the following 3 variables.
  \describe{
    \item{\code{loc}}{location}
    \item{\code{locgroup}}{location group: Grp1-Grp2}
    \item{\code{gen}}{genotype}
    \item{\code{gengroup}}{genotype group: W1, W2, W3}
    \item{\code{yield}}{grain yield, tons/ha}
  }
}
\details{
  Grain yield from the 8th Elite Selection Wheat Yield Trial to evaluate
  18 bread wheat genotypes at 25 locations in 15 countries.

  Cross et al. used this data to cluster loctions into 2
  mega-environments and clustered genotypes into 3 wheat clusters.

  Locations
  \tabular{lllrr}{
    Code \tab Country \tab Location \tab Latitude (N) \tab Elevation (m) \cr
    AK \tab Algeria \tab El Khroub \tab 36 \tab 640 \cr
    AL \tab Algeria \tab Setif \tab 36 \tab 1,023 \cr
    BJ \tab Bangladesh \tab Joydebpur \tab 24 \tab 8 \cr
    CA \tab Cyprus \tab Athalassa \tab 35 \tab 142 \cr
    EG \tab Egypt \tab E1 Gemmeiza \tab 31 \tab 8 \cr
    ES \tab Egypt \tab Sakha \tab 31 \tab 6 \cr
    EB \tab Egypt \tab Beni-Suef \tab 29 \tab 28 \cr
    IL \tab India \tab Ludhiana \tab 31 \tab 247 \cr
    ID \tab India \tab Delhi \tab 29 \tab 228 \cr
    JM \tab Jordan \tab Madaba \tab 36 \tab 785 \cr
    KN \tab Kenya \tab Njoro \tab 0 \tab 2,165 \cr
    MG \tab Mexico \tab Guanajuato \tab 21 \tab 1,765 \cr
    MS \tab Mexico \tab Sonora \tab 27 \tab 38 \cr
    MM \tab Mexico \tab Michoacfin \tab 20 \tab 1,517 \cr
    NB \tab Nepal \tab Bhairahwa \tab 27 \tab 105 \cr
    PI \tab Pakistan \tab Islamabad \tab 34 \tab 683 \cr
    PA \tab Pakistan \tab Ayub \tab 32 \tab 213 \cr
    SR \tab Saudi Arabia \tab Riyadh \tab 24 \tab 600 \cr
    SG \tab Sudan \tab Gezira \tab 14 \tab 411 \cr
    SE \tab Spain \tab Encinar \tab 38 \tab 20 \cr
    SJ \tab Spain \tab Jerez \tab 37 \tab 180 \cr
    SC \tab Spain \tab Cordoba \tab 38 \tab 110 \cr
    SS \tab Spain \tab Sevilla \tab 38 \tab 20 \cr
    TB \tab Tunisia \tab Beja \tab 37 \tab 150 \cr
    TC \tab Thailand \tab Chiang Mai \tab 18 820 \cr
  }

  Used with permission of Jose' Crossa.

}
\source{
  Crossa, J and Fox, PN and Pfeiffer, WH and Rajaram, S and Gauch Jr,
  HG. (1991).
  AMMI adjustment for statistical analysis of an
  international wheat yield trial.
  Theoretical and Applied Genetics, 81, 27--37.
  http://doi.org/10.1007/BF00226108
}
\references{
  Jean-Louis Laffont, Kevin Wright and Mohamed Hanafi (2013).
  Genotype + Genotype x Block of Environments (GGB) Biplots.
  Crop Science, 53, 2332-2341.
  http://doi.org/10.2135/cropsci2013.03.0178
}

\examples{
\dontrun{

library(agridat)
data(crossa.wheat)
dat <- crossa.wheat

# AMMI biplot.  Fig 3 of Crossa et al.
libs(agricolae)
m1 <- with(dat, AMMI(E=loc, G=gen, R=1, Y=yield))
b1 <- m1$biplot[,1:4]
b1$PC1 <- -1 * b1$PC1 # Flip vertical
plot(b1$yield, b1$PC1, cex=0.0,
     text(b1$yield, b1$PC1, cex=.5, labels=row.names(b1),col="brown"),
     main="crossa.wheat AMMI biplot",
     xlab="Average yield", ylab="PC1", frame=TRUE)
mn <- mean(b1$yield)
abline(h=0, v=mn, col='wheat')

g1 <- subset(b1,type=="GEN")
text(g1$yield, g1$PC1, rownames(g1), col="darkgreen", cex=.5)

e1 <- subset(b1,type=="ENV")
arrows(mn, 0,
       0.95*(e1$yield - mn) + mn, 0.95*e1$PC1,
       col= "brown", lwd=1.8,length=0.1)

# GGB example
library(agridat)
data(crossa.wheat)
dat2 <- crossa.wheat
libs(gge)
# Specify env.group as column in data frame
m2 <- gge(dat2, yield~gen*loc, env.group=locgroup, scale=FALSE)
biplot(m2, main="crossa.wheat - GGB biplot")

}
}
\keyword{datasets}
