\name{cochran.bib}
\alias{cochran.bib}
\docType{data}
\title{
  Multi-environment trial of corn, balanced incomplete block design
}
\description{
  Balanced incomplete block design in corn
}

\format{
  A data frame with 52 observations on the following 3 variables.
  \describe{
    \item{\code{loc}}{location/block, 13 levels}
    \item{\code{gen}}{genotype/line, 13 levels}
    \item{\code{yield}}{yield, pounds/plot}
  }
}
\details{
  Incomplete block design.  Each loc/block has 4 genotypes/lines.
  The blocks are planted at different locations.

  Conducted in 1943 in North Carolina.
}
\source{
  North Carolina Agricultural Experiment Station,
  United States Department of Agriculture.
}
\references{
  Cochran, W.G. and Cox, G.M. (1957),
  \emph{Experimental Designs}, 2nd ed., Wiley and Sons, New York, p. 448.
}

\examples{

data(cochran.bib)
dat <- cochran.bib

# Show the incomplete-block structure
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield~loc*gen, dat,
          col.regions=redblue,
          xlab="loc (block)", main="cochran.bib - incomplete blocks")

with(dat, table(gen,loc))
rowSums(as.matrix(with(dat, table(gen,loc))))
colSums(as.matrix(with(dat, table(gen,loc))))

m1 = aov(yield ~ gen + Error(loc), data=dat)
summary(m1)

require(nlme)
m2 = lme(yield ~ -1 + gen, data=dat, random=~1|loc)

}

