\name{goulden.splitsplit}
\alias{goulden.splitsplit}
\docType{data}
\title{
  Split-split plot experiment of wheat
}
\description{
  Split-split plot experiment of wheat
}
\usage{data("goulden.splitsplit")}
\format{
  A data frame with 160 observations on the following 9 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
    \item{\code{inoc}}{inoculate}
    \item{\code{trt}}{treatment number}
    \item{\code{gen}}{genotype}
    \item{\code{dry}}{dry/wet dust application}
    \item{\code{dust}}{dust treatment}
    \item{\code{block}}{block}
  }
}
\details{

  An interesting split-split plot experiment in which the sub-plot
  treatments have a 2*5 factorial structure.
  
  An experiment was conducted in 1932 on the experimental field of the
  Dominion Rust Research Laboratory.  The study was designed to
  determine the effect on the incidence of root rot, of variety of
  wheat, kinds of dust for seed treatment, method of application of the
  dust, and efficacy of soil inoculation with the root-rot organism.

  The field had 4 blocks.

  Each block has 2 whole plots for the genotypes.

  Each whole-plot had 10 sub-plots for the 5 different kinds of dust and
  2 methods of application.

  Each sub-plot had 2 sub-sub-plots, one for inoculated soil and the
  other one for uninoculated soil.
  
}

\source{
  C. H. Goulden, (1939).
  \emph{Methods of statistical analysis}, 1st ed. Page 18. 
  https://archive.org/stream/methodsofstatist031744mbp

}
\references{
  None
}
\examples{

data(goulden.splitsplit)
dat <- goulden.splitsplit

if(require(desplot)) {

  ## Experiment design. Goulden p. 152-153
  ## desplot(gen ~ col*row, data=dat,
  ##         out1=block, out2=trt, text=dust, col=inoc, cex=1,
  ##         main="goulden.splitsplit")
  
  desplot(yield ~ col*row, data=dat,
          out1=block, out2=gen, col=inoc, num=trt, cex=1,
          main="goulden.splitsplit")

}

# Match Goulden table 40
m1 <- aov(yield ~ gen
          + dust + dry + dust:dry + gen:dust + gen:dry + gen:dust:dry
          + inoc + inoc:gen + inoc:dust + inoc:dry
          + inoc:dust:dry +inoc:gen:dust + inoc:gen:dry
          + Error(block/(gen+gen:dust:dry+gen:inoc:dry)), data=dat)
summary(m1)

}
\keyword{datasets}
