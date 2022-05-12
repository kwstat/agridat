\name{kling.augmented}
\alias{kling.augmented}
\docType{data}
\title{
  Augmented design of meadowfoam
}
\description{
  Augmented design of meadowfoam
}
\usage{data("kling.augmented")}
\format{
  A data frame with 68 observations on the following 7 variables.
  \describe{
    \item{\code{plot}}{Plot number}
    \item{\code{gen}}{Genotype / Entry}
    \item{\code{name}}{Genotype name}
    \item{\code{block}}{Block, text}
    \item{\code{tsw}}{Thousand seed weight}
    \item{\code{row}}{Row ordinate}
    \item{\code{col}}{Column ordinate}
  }
}
\details{
  An experiment with meadowfoam.
  Blocks are in one direction, serpentine layout.
  There are 50 new genotypes and 3 checks (C1=Ross, C2=OMF183,
  C3=Starlight).
  New genotypes have 1 rep, checks have 6 reps.
  The response variable is thousand seed weight.
}
\source{
  Jennifer Kling, "Introduction to Augmented Experimental Design"
  https://plant-breeding-genomics.extension.org/introduction-to-augmented-experimental-design/
  Accessed May 2022.          
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(kling.augmented)
dat <- kling.augmented
libs(desplot,lattice,lme4)
# Layout and yields
desplot(dat, tsw ~ col*row, text=name, cex=1.5)

# Mixed model, fixed blocks, random genotypes
m1 <- lmer(tsw ~ block + (1|name), data=dat)
ran1 <- ranef(m1, condVar=TRUE)
ran1
dotplot(ran1) # Caterpillar plot
}
}
\keyword{datasets}
