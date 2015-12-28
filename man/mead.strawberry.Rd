\name{mead.strawberry}
\alias{mead.strawberry}
\docType{data}
\title{
  Strawberry yields in RCB experiment
}
\description{
  Strawberry yields in RCB experiment
}

\format{
  A data frame with 32 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{col}}{Column}
    \item{\code{block}}{Block factor, 4 levels}
    \item{\code{gen}}{Genotype factor, 8 levels}
    \item{\code{yield}}{Yield, pounds}
  }
}
\details{
  A hedge along the right side (column 8) caused shading and lower
  yields.

  R. Mead said (in a discussion of the Besag & Higdon paper),
  "the blocks defined (as given to me by the experimenter)
  are the entire horizontal rows...the design of the trial is actually
  (and unrecognized by me also) a checker-board of eight half-blocks
  with two groups of split-plot varieties".

  The two sub-groups of genotypes are G, V, R1, F and Re, M, E, P.
}
\source{
  Unknown, but prior to 1968 according to Besag. Probably via R. Mead.
}
\references{
  R. Mead, 1990, \emph{The Design of Experiments}.

  Julian Besag and D Higdon, 1999.
  Bayesian Analysis of Agricultural Field Experiments,
  \emph{Journal of the Royal Statistical Society: Series B (Statistical
    Methodology)},61, 691--746. Table 4.

}

\examples{

data(mead.strawberry)
dat <- mead.strawberry
dat$sub <- ifelse(is.element(dat$gen, c('G', 'V', 'R1', 'F')),
              "S1","S2")

if(require(desplot)){
desplot(yield~col*row, dat, text=gen, cex=1, out1=block, out2=sub,
        main="mead.strawberry")
}

}
