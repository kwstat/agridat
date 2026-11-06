\name{immer.mets}
\alias{immer.mets}
\docType{data}
\title{
  Multi-environment trials of barley and wheat
}
\description{
  Multi-environment trials of barley and wheat in Minnesota in 1930s.
}
\usage{data("immer.mets")}
\format{
  A data frame with 255 observations on the following 6 variables.
  \describe{
    \item{\code{crop}}{crop: barley or wheat}
    \item{\code{year}}{1931, 1932, 1935}
    \item{\code{loc}}{location}
    \item{\code{gen}}{genotype}
    \item{\code{rep}}{replication block}
    \item{\code{yield}}{yield, bu/ac}
  }
}
\details{

Barley data ----------

Multienviroment trials with 4 locs, 4 varieties, 3 reps, 2 years (1932, 1935).

Immer (1950) said the 1932 data were used because 1933 and 1934 were drought years with low yield.

The StPaul location is called "Univ. Farm" (University Farm) in the source document.

The barley data is from LeClerg (1962, p 217), Hayes et al. (1942) or Immer (1950).

Data provenance: K.Wright prepared the electronic data from page 340 of Hays (1942).

Wheat data ----------

Multienviroment trials with 3 locs, 5 varieties, 3 reps, 3 years (1931, 1932, 1935).

The value for 1935, StPaul, Hope, Rep 2 is 24.5 (not 21.7 as in the source) based on the totals.

The source document has "U.Farm" (University Farm) which is called "StPaul" here.

The wheat rep numbers are R1, R2, R3 in the source document, but are changed to
R01, R02, R03 here to emphasize the wheat and barley are (almost certainly) in different
replicates.

The wheat data is from LeClerg et al (1962).

Data provenance: K.Wright prepared the data from page 234 of LeClerg et al. (1962).

}
\source{
  Erwin LeClerg, Warren Leonard, Andrew Clark (1962).
  Field Plot Technique.
  https://archive.org/details/fieldplottechniq0000lecl
}
\references{
  Hayes, Herbert & Forrest Immer (1942).
  Methods of Plant Breeding
  https://archive.org/details/in.ernet.dli.2015.200783/page/n359/mode/2up

  Immer, Forrest (1950).
  Applied Statistis: A Series of Lectures in the Graduate School of the University of Minnesota.
  Burgess Publishing Company, Minneapolis, Minnesota. p. 16
}
\examples{
library(agridat)
data(immer.mets)

# Yield totals match LeClerg
# sum(subset(immer.mets, crop=="barley")$yield)
# sum(subset(dat, crop=="wheat")$yield) 

datb <- subset(immer.mets, crop=="barley")
datb <- transform(datb, year=factor(year), loc=factor(loc),
                  gen=factor(gen), rep=factor(rep))
# Full anova. Match Immer p 22
m1 <- aov(yield ~ rep + loc + year + gen + gen:loc + gen:year + gen:loc:year +
  loc:year + rep:loc + rep:year + rep:loc:year, data=datb)
anova(m1)

# library(latticeExtra)
# useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=datb))
}
\keyword{datasets}
