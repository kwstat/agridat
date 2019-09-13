\name{pacheco.soybean}
\alias{pacheco.soybean}
\docType{data}
\title{
  Multi-environment trial of soybean in Brazil.
}
\description{
  Yields of 18 soybean genotypes at 11 environments in Brazil.
}

\format{
  \describe{
    \item{\code{gen}}{genotype, 18 levels}
    \item{\code{env}}{environment, 11 levels}
    \item{\code{yield}}{yield, kg/ha}
  }
}
\details{
  In each environment was used an RCB design with 3 reps.  The means of
  the reps are shown here.
}
\source{
  R M Pacheco, J B Duarte, R Vencovsky, J B Pinheiro, A B Oliveira,
  (2005). Use of supplementary genotypes in AMMI analysis.
  \emph{Theor Appl Genet}, 110, 812-818.
  http://doi.org/10.1007/s00122-004-1822-6

  Used with permission of Robert Pacheco.
}

\examples{
\dontrun{

library(agridat)
data(pacheco.soybean)
dat <- pacheco.soybean

# AMMI biplot similar to Fig 2 of Pacheco et al.
libs(agricolae)
m1 <- with(dat, AMMI(env, gen, REP=1, yield))
bip <- m1$biplot[,1:3]
# Fig 1 of Pacheco et al.
with(bip, plot(yield, PC1, cex=0.0,
               text(yield,PC1,labels=row.names(bip), col="blue"),
               xlim=c(1000,3000),main="pacheco.soybean - AMMI biplot",frame=TRUE))
with(bip[19:29,], points(yield, PC1, cex=0.0,
                         text(yield,PC1,labels=row.names(bip[19:29,]),
                              col="darkgreen")))

}
}
\keyword{datasets}
