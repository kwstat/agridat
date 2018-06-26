\name{giles.wheat}
\alias{giles.wheat}
\docType{data}
\title{
  Straw length and ear emergence for wheat genotypes.
}
\description{
  Straw length and ear emergence for wheat genotypes.  Data are
  unbalanced with respect to experiment year and genotype.
}
\usage{data("giles.wheat")}
\format{
  A data frame with 247 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype. Note, this is numeric!}
    \item{\code{env}}{environment}
    \item{\code{straw}}{straw length}
    \item{\code{emergence}}{ear emergence, Julian date}
  }
}
\details{
  
  Highly unbalanced data of straw length and ear emergence date for
  wheat genotypes.

  The 'genotype' column is called 'Accession number' in original data.
  The genotypes were chosen to represent the range of variation in the
  trait.

  The Julian date was found to be preferable to other methods (such as
  days from sowing).

  Piepho (2003) fit a bilinear model to the straw emergence data.  This
  is similar to Finlay-Wilkinson regression.
  
}

\source{
  R. Giles (1990).
  Utilization of unreplicated observations of agronomic characters in a wheat germplasm collection.
  In: \emph{Wheat Genetic Resources. Meeting Diverse Needs}.
  Wiley, Chichester, U.K., pp.113-130.
}
\references{
  
  Piepho, HP (2003).
  Model-based mean adjustment in quantitative germplasm evaluation data.
  \emph{Genetic Resources and Crop Evolution}, 50, 281-290.
  http://doi.org/10.1023/A:1023503900759
  
}
\examples{

library(agridat)
data(giles.wheat)
dat <- giles.wheat
dat <- transform(dat, gen=factor(gen))
dat <- transform(dat, env=factor(env))
dat1 <- subset(dat, !is.na(straw))
dat2 <- subset(dat, !is.na(emergence))

# Traits are not related
# with(dat, plot(straw~emergence))

# Show unbalancedness of data
if(require(lattice) & require(reshape2)){
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  levelplot(acast(dat, gen ~ env, value.var='emergence'),
            col.regions=redblue,
            xlab="genotype", ylab="year",
            main="giles.wheat - straw length")
}

\dontrun{

# Analysis of straw length

require(emmeans)
require(gnm)

# Mean across years. Matches Piepho Table 7 'Simple'
m1 = lm(straw ~ gen, data=dat1)
emmeans(m1, 'gen')

# Simple two-way model.  NOT the bi-additive model of Piepho.
m2 = lm(straw ~ gen + env, data=dat1)
emmeans(m2, 'gen')

# Bi-additive model. Matches Piepho Table 6, rows (c)
library(gnm)
m3 <- gnm(straw ~ env + Mult(gen,env), data=dat1)
cbind(adjusted=round(fitted(m3),0), dat1) 

# Analysis of Ear emergence

require(emmeans)
  
# Simple two-way model. 
m4 = lm(emergence ~ 1 + gen + env, data=dat2)
emmeans(m4, c('gen','env')) # Matches Piepho Table 9. rpws (c)
emmeans(m4, 'gen') # Match Piepho table 10, Least Squares column

}

}
\keyword{datasets}
