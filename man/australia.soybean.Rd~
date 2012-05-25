\name{australia.soybean}
\alias{australia.soybean}
\docType{data}
\title{
  Australia soybeans
}
\description{
  Yield and other traits of 58 varieties of soybeans, grown in four
  locations across two years in Australia.  This is four-way data of
  Year x Loc x Gen x Trait.
}
\usage{australia.soybean}
\format{
  A data frame with 464 observations on the following 10 variables.
  \describe{
    \item{\code{env}}{Factor with 8 levels, first character of location
      and last two characters of year}
    \item{\code{loc}}{Four locations: Brookstead, Lawes, Nambour, RedlandBay}
    \item{\code{year}}{Year: 1970 or 1971}
    \item{\code{gen}}{Genotype factor of soybeans, 1-58}
    \item{\code{yield}}{Yield, metric tons / hectare}
    \item{\code{height}}{Height, in meters}
    \item{\code{lodging}}{Lodging}
    \item{\code{size}}{Seed size in millimeters}
    \item{\code{protein}}{Protein in percentage}
    \item{\code{oil}}{Oil, in percentage}
  }
}
\details{
Measurement are available from four locations in Queensland, Australia in two
consecutive years 1970, 1971.

The 58 different genotypes of soybeans consisted of 43 lines (40
local Australian selections from a cross, their two parents, and one other
which was used a parent in earlier trials) and 15 other lines of which 12 were
from the US. 

Lines 1-40 were local Australian selections from Mamloxi (CPI 172) and
Avoyelles (CPI 15939). 

\tabular{ll}{
No. \tab Line \cr
1-40 \tab Local selections \cr
41 \tab Avoyelles (CPI 15939) Tanzania \cr
42 \tab Hernon 49 (CPI 15948) Tanzania \cr
43 \tab Mamloxi (CPI 172)  Nigeria \cr
44 \tab Dorman  USA \cr
45 \tab Hampton  USA \cr
46 \tab Hill  USA \cr
47 \tab Jackson  USA \cr
48 \tab Leslie  USA \cr
49 \tab Semstar  Australia \cr
50 \tab Wills  USA \cr
51 \tab C26673  Morocco \cr
52 \tab C26671  Morocco \cr
53 \tab Bragg  USA \cr
54 \tab Delmar  USA \cr
55 \tab Lee  USA \cr
56 \tab Hood  USA \cr
57 \tab Ogden  USA \cr
58 \tab Wayne  USA \cr
}

Note on the data in Basford and Tukey book. The values for line 58 for
Nambour 1970 and Redland Bay 1971 are 
incorrectly listed on page 477 as 20.490 and 15.070. They should be 17.350 and
13.000, respectively. In the data set made available here, these values have
been corrected. 
}

\source{
  Basford, K. E., and Tukey, J. W. (1999). Graphical analysis of multiresponse
  data illustrated with a plant breeding trial. Chapman and Hall/CRC.
  
  Retrieved from:
  \url{http://three-mode.leidenuniv.nl/data/soybeaninf.htm}.

  Used with permission of Kaye Basford, Pieter Kroonenberg.
}
\references{
  K E Basford. 1982. The Use of Multidimensional Scaling in Analysing
  Multi-Attribute Genotype Response Across Environments,
  \emph{Aust J Agric Res}, 33, 473--480.
  
  Kroonenberg, P. M., & Basford, K. E. B. (1989). An investigation of
  multi-attribute genotype response across environments using three-mode
  principal component analysis. \emph{Euphytica}, 44, 109--123.
}
\examples{
dat <- australia.soybean
dm <- melt(dat, id.var=c('env', 'year','loc','gen'))

# Joint plot of genotypes & traits. Similar to Figure 1 of Kroonenberg 1989
dmat <- acast(dm, gen~variable, fun=mean)
dmat <- scale(dmat)
biplot(princomp(dmat), main="australia.soybean trait x gen biplot", cex=.75)

# Figure 1 of Kozak 2010, lines 44-58
dmat2 <- dmat[44:58,]
require(lattice)
parallelplot(dmat2[,c(2:6,1)], horiz=FALSE)
}

