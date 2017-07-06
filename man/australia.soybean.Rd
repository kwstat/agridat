\name{australia.soybean}
\alias{australia.soybean}
\docType{data}
\title{
  Multi-environment trial of soybean in Australia
}
\description{
  Yield and other traits of 58 varieties of soybeans, grown in four
  locations across two years in Australia.  This is four-way data of
  Year x Loc x Gen x Trait.
}

\format{
  A data frame with 464 observations on the following 10 variables.
  \describe{
    \item{\code{env}}{environment, 8 levels, first character of location
      and last two characters of year}
    \item{\code{loc}}{location}
    \item{\code{year}}{year}
    \item{\code{gen}}{genotype of soybeans, 1-58}
    \item{\code{yield}}{yield, metric tons / hectare}
    \item{\code{height}}{height (meters)}
    \item{\code{lodging}}{lodging}
    \item{\code{size}}{seed size, (millimeters)}
    \item{\code{protein}}{protein (percentage)}
    \item{\code{oil}}{oil (percentage)}
  }
}
\details{

  Measurement are available from four locations in Queensland, Australia in two
  consecutive years 1970, 1971.

  The 58 different genotypes of soybeans consisted of 43 lines (40 local
  Australian selections from a cross, their two parents, and one other
  which was used a parent in earlier trials) and 15 other lines of which
  12 were from the US.

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
  http://three-mode.leidenuniv.nl/data/soybeaninf.htm

  Used with permission of Kaye Basford, Pieter Kroonenberg.
}
\references{
  
  K E Basford. 1982. The Use of Multidimensional Scaling in Analysing
  Multi-Attribute Genotype Response Across Environments,
  \emph{Aust J Agric Res}, 33, 473--480.

  Kroonenberg, P. M., & Basford, K. E. B. (1989). An investigation of
  multi-attribute genotype response across environments using three-mode
  principal component analysis.
  \emph{Euphytica}, 44, 109--123.

  Marcin Kozak (2010).
  Use of parallel coordinate plots in multi-response selection of
  interesting genotypes.
  \emph{Communications in Biometry and Crop Science}, 5, 83-95.

}
\examples{

data(australia.soybean)
dat <- australia.soybean

if(require(reshape2)){
dm <- melt(dat, id.var=c('env', 'year','loc','gen'))

# Joint plot of genotypes & traits. Similar to Figure 1 of Kroonenberg 1989
dmat <- acast(dm, gen~variable, fun=mean)
dmat <- scale(dmat)
biplot(princomp(dmat), main="australia.soybean trait x gen biplot", cex=.75)
}

# Figure 1 of Kozak 2010, lines 44-58
\dontrun{
  require(agridat); require(reshape2) ; require(lattice); require(latticeExtra)
  dat <- australia.soybean
  dat <- melt(dat, id.var=c('env', 'year','loc','gen'))
  dat <- acast(dat, gen~variable, fun=mean)
  dat <- scale(dat)
  dat <- as.data.frame(dat)[,c(2:6,1)]
  dat$gen <- rownames(dat)
  # data for the graphic by Kozak
  dat2 <- dat[44:58,]
  dat3 <- subset(dat2, gen %in% c("G48","G49","G50","G51"))
  
  parallelplot( ~ dat3[,1:6]|dat3$gen, main="australia.soybean",
               as.table=TRUE, horiz=FALSE) +
    parallelplot( ~ dat2[,1:6], horiz=FALSE, col="gray80") +
    parallelplot( ~ dat3[,1:6]|dat3$gen,
                 as.table=TRUE, horiz=FALSE, lwd=2)
}

}

