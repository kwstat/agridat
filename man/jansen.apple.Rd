\name{jansen.apple}
\alias{jansen.apple}
\docType{data}
\title{
  Infestation of apple shoots by apple canker.
}
\description{
  Infestation of apple shoots by apple canker.
}
\usage{data("jansen.apple")}
\format{
  A data frame with 36 observations on the following 5 variables.
  \describe{
    \item{\code{inoculum}}{inoculum level}
    \item{\code{gen}}{genotype/variety}
    \item{\code{block}}{block}
    \item{\code{y}}{number of inoculations developing canker}
    \item{\code{n}}{number of inoculations}
  }
}
\details{
  Shoots of apple trees were infected with fungus \emph{Nectria
    galligena}, which may cause apple canker.

  The incoulum density treatment had 3 levels, measured in macroconidia
  per ml.

  There were 4 blocks.
  
}
\source{

  J. Jansen & J.A. Hoekstra (1993).
  The analysis of proportions in agricultural experiments by a
  generalized linear mixed model. 
  \emph{Statistica Neerlandica}, 47(3), 161-174.

  Used with permission of J. Jansen. Electronic version supplied by Miroslav Zoric.

}
\references{
  None.
}
\examples{
data(jansen.apple)


dat <- jansen.apple

require(lattice)
dotplot(gen ~ y/n|block, data=dat, group=inoculum, auto.key=TRUE,
        main="jansen.apple",
        xlab="Proportion infected per block/inoculum", ylab="Genotype")

if(require(lme4)){
  # Tentative model.  Needs improvement.
  m1 <- glmer(cbind(y,n-y) ~ gen + factor(inoculum) + (1|block),
              data=dat, family=binomial)
  summary(m1)
}

}
\keyword{datasets}
