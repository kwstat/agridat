\name{gomez.stripsplitplot}
\alias{gomez.stripsplitplot}
\docType{data}
\title{
  Strip-split-plot experiment of rice
}
\description{
  A strip-split-plot experiment with three reps, genotype as the horizontal
  strip, nitrogen fertilizer as the vertical strip, and planting method
  as the subplot factor.
}

\format{
  \describe{
    \item{\code{yield}}{grain yield in kg/ha}
    \item{\code{planting}}{planting factor, P1=broadcast, P2=transplanted}
    \item{\code{rep}}{rep, 3 levels}
    \item{\code{nitro}}{nitrogen fertilizer, kg/ha}
    \item{\code{gen}}{genotype, G1 to G6}
    \item{\code{col}}{column}
    \item{\code{row}}{row}
  }
}
\details{
  Note, this is a superset of the the 'gomez.stripplot' data.
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 155.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.stripsplitplot)
dat <- gomez.stripsplitplot

# Layout
if(require(desplot)){
  desplot(gen ~ col*row, dat,
          out1=rep, col=nitro, text=planting, cex=1,
          main="gomez.stripsplitplot")
}


# Gomez table 4.19, ANOVA of strip-split-plot design
dat <- transform(dat, nf=factor(nitro))
m1 <- aov(yield ~ nf * gen * planting +
          Error(rep + rep:nf + rep:gen + rep:nf:gen), data=dat)
summary(m1)

\dontrun{
# There is a noticeable linear trend along the y coordinate which may be
# an artifact that blocking will remove, or may need to be modeled.
# Note the outside values in the high-nitro boxplot.
require("HH")
  interaction2wt(yield ~ nitro + gen + planting + row, dat,
                 x.between=0, y.between=0,
                 x.relation="free")
}
}

