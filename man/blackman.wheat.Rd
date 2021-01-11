\name{blackman.wheat}
\alias{blackman.wheat}
\docType{data}
\title{
  Multi-environment trial of wheat, conventional and semi-dwarf varieties
}
\description{
  Multi-environment trial of wheat, conventional and semi-dwarf
  varieties, 7 locs with low/high fertilizer levels.
}

\format{
  A data frame with 168 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{loc}}{location}
    \item{\code{nitro}}{nitrogen fertilizer, low/high}
    \item{\code{yield}}{yield (g/m^2)}
    \item{\code{type}}{type factor, conventional/semi-dwarf}
  }
}
\details{
  Conducted in U.K. in 1975.  Each loc had three reps, two nitrogen
  treatments.

  Locations were Begbroke, Boxworth, Crafts Hill, Earith, Edinburgh,
  Fowlmere, Trumpington.

  At the two highest-yielding locations, Earith and Edinburgh, yield was
  _lower_ for the high-nitrogen treatment.  Blackman et al. say "it
  seems probable that effects on development and structure of the crop
  were responsible for the reductions in yield at high nitrogen".
}
\source{
  Blackman, JA and Bingham, J. and Davidson, JL (1978).
  Response of semi-dwarf and conventional winter wheat varieties to the
  application of nitrogen fertilizer.
  \emph{The Journal of Agricultural Science}, 90, 543--550.
  https://doi.org/10.1017/S0021859600056070
}
\references{
  Gower, J. and Lubbe, S.G. and Gardner, S. and Le Roux, N. (2011).
  \emph{Understanding Biplots}, Wiley.
}
\examples{
\dontrun{

library(agridat)
data(blackman.wheat)
dat <- blackman.wheat

libs(lattice)

# Semi-dwarf generally higher yielding than conventional
# bwplot(yield~type|loc,dat, main="blackman.wheat")

# Peculiar interaction--Ear/Edn locs have reverse nitro response
dotplot(gen~yield|loc, dat, group=nitro, auto.key=TRUE,
        main="blackman.wheat: yield for low/high nitrogen")

# Height data from table 6 of Blackman.  Height at Trumpington loc.
# Shorter varieties have higher yields, greater response to nitro.
heights <- data.frame(gen=c("Cap", "Dur", "Fun", "Hob", "Hun", "Kin",
                            "Ran", "Spo", "T64", "T68","T95", "Tem"),
                      ht=c(101,76,76,80,98,88,98,81,86,73,78,93))
dat$height <- heights$ht[match(dat$gen, heights$gen)]
xyplot(yield~height|loc,dat,group=nitro,type=c('p','r'),
       main="blackman.wheat",
       subset=loc=="Tru", auto.key=TRUE)


libs(reshape2)
# AMMI-style biplot Fig 6.4 of Gower 2011
dat$env <- factor(paste(dat$loc,dat$nitro,sep="-"))
datm <- acast(dat, gen~env, value.var='yield')
datm <- sweep(datm, 1, rowMeans(datm))
datm <- sweep(datm, 2, colMeans(datm))
biplot(prcomp(datm), main="blackman.wheat AMMI-style biplot")


}
}
\keyword{datasets}
