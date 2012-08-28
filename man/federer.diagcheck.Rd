\name{federer.diagcheck}
\alias{federer.diagcheck}
\docType{data}
\title{
  Wheat experiment with diagonal checks
}
\description{
  Wheat experiment augmented with two check varieties in diagonal strips.
}
\usage{data(federer.diagcheck)}
\format{
  A data frame with 180 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{gen}}{Genotype factor, 120 levels}
    \item{\code{yield}}{Yield}
  }
}
\details{
  This experiment was conducted by Matthew Reynolds, CIMMYT.  There are
  180 plots in the field, 60 for the diagonal checks (G121 and G122) and
  120 for new varieties.

  Federer used this data in multiple papers to illustrate the use of
  orthogonal polynomials to model field trends that are not related to
  the genetic effects.
  
  Note: Federer and Wolfinger (2003) provide a SAS program for analysis
  of this data.  However, when the program is used to analyze this data,
  the results do not match the results given in Federer (1998) nor
  Federer and Wolfinger (2003).  The differences are slight, which
  suggests a typographical error in the presentation of the data.

  The R code below provides results that are consistent with the SAS
  code of Federer & Wolfinger (2003) when both are applied to this
  version of the data.   
}
\source{
  Federer, Walter T. 1998. Recovery of interblock, intergradient, and
  intervariety information in incomplete block and lattice rectangle
  design experiments. \emph{Biometrics}, 54, 471--481.
}
\references{
  Walter T Federer and Russell D Wolfinger, 2003.
  Augmented Row-Column Design and Trend Analysis, chapter 28 of
  \emph{Handbook of Formulas and Software for Plant Geneticists
    and Breeders}, Haworth Press.
}
\examples{
dat <- federer.diagcheck

# Show the layout in Federer 1998.
dat$check <- ifelse(dat$gen == "G121" | dat$gen=="G122", "C","N")
desplot(yield ~ col*row, dat, text=gen, show.key=FALSE,
      shorten='no', col=check, cex=.8, col.text=c("yellow","white"))

# Only to match SAS results
dat$row <- 16 - dat$row
dat=dat[order(dat$col, dat$row), ] 

# Add row / column polynomials to the data.
# The scaling factors sqrt() are arbitrary, but used to match SAS
nr <- length(unique(dat$row))
nc <- length(unique(dat$col))
rpoly <- poly(dat$row, degree=10) * sqrt(nc)
cpoly <- poly(dat$col, degree=10) * sqrt(nr)
dat <- transform(dat,
                 c1 = cpoly[,1], c2 = cpoly[,2], c3 = cpoly[,3],
                 c4 = cpoly[,4], c6 = cpoly[,6], c8 = cpoly[,8],
                 r1 = rpoly[,1], r2 = rpoly[,2], r3 = rpoly[,3],
                 r4 = rpoly[,4], r8 = rpoly[,8], r10 = rpoly[,10])
dat$trtn <- ifelse(dat$gen == "G121" | dat$gen=="G122", dat$gen, "G999")
dat$new <- ifelse(dat$gen == "G121" | dat$gen=="G122", "N", "Y")
dat <- transform(dat, trtn=factor(trtn), new=factor(new))

m1 <- lm(yield ~ c1 + c2 + c3 + c4 + c6 + c8
         + r1 + r2 + r4 + r8 + r10
         + c1:r1 + c2:r1 + c3:r1 + gen, data = dat)
# To get Type III SS use the following
if(require(car)) {
Anova(m1, type=3) # Matches PROC GLM output
}

# lmer
dat$one <- factor(rep(1, nrow(dat)))
library(lme4)
m2 <- lmer(yield ~ trtn + (0+r1|one) + (0+r2|one) + (0+r4|one) + (0+r8|one) + (0+r10|one)
           + (0+c1|one) + (0+c2|one) + (0+c3|one) + (0+c4|one) + (0+c6|one) + (0+c8|one)
           + (0+r1:c1|one) + (0+r1:c2|one) + (0+r1:c3|one) +(1|new:gen)
           , data = dat)
m2        # Matches variance comps from PROC MIXED
ranef(m2) # Matches random effects from PROC MIXED

\dontrun{
# asreml
m3 <- asreml(yield ~ -1 + trtn, data=dat,
             random = ~ r1 + r2 + r4 + r8 + r10 +
             c1 + c2 + c3 + c4 + c6 + c8 + r1:c1 + r1:c2 + r1:c3 + new:gen)
coef(m3)
summary(m3)$varcomp
}

}
\keyword{datasets}
