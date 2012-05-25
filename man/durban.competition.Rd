\name{durban.competition}
\alias{durban.competition}
\docType{data}
\title{
  Sugar beet yields with competition effects
}
\description{
  Sugar beet yields with competition effects
}
\usage{durban.competition}
\format{
  A data frame with 114 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{Genotype factor, 36 levels plus Border}
    \item{\code{column}}{Column}
    \item{\code{block}}{Row/Block}
    \item{\code{wheel}}{Position relative to wheel tracks}
    \item{\code{yield}}{Root yields, kg/plot}
  }
}
\details{
  The trial was conducted in 1979.
  
  Single-row plots, 12 m long, 0.5 m between rows.  Each block is made
  up of all 36 genotypes laid out side by side.  Guard/border plots are
  at each end.  Root yields were collected.

  Wheel tracks are located between columns 1 and 2, and between columns
  5 and 6, for each set of six plots.  Each genotype was randomly
  allocated once to each pair of plots (1,6), (2,5), (3,4) across the
  three reps.  Wheel effect were not significant in _this_ trial.
}
\source{
  Durban, M., Currie, I. and R. Kempton, 2001.
  Adjusting for fertility and competition in variety trials.
  \emph{J. of Agricultural Science}, 136, 129--140.

  Retrieved from
  \url{http://www.ma.hw.ac.uk/~iain/research/JAgSciData/data/Trial1.dat}

  Used with permission of Iain Currie.
}

\examples{

dat <- durban.competition

# Check that genotypes were balanced across wheel tracks.
with(dat, table(gen,wheel))

desplot(yield ~ column*block, dat, out1=block, text=gen, col=wheel)

# Calculate residual after removing block/genotype effects
m1 <- lm(yield ~ gen + block, data=dat)
dat$res <- resid(m1)

desplot(res ~ column*block, dat, out1=block, text=gen, col=wheel)

# Calculate mean of neighboring plots
dat$comp <- NA
dat$comp[3:36] <- ( dat$yield[2:35] + dat$yield[4:37] ) / 2
dat$comp[41:74] <- ( dat$yield[40:73] + dat$yield[42:75] ) / 2
dat$comp[79:112] <- ( dat$yield[78:111] + dat$yield[80:113] ) / 2

# Demonstrate the competition effect
# Competitor plots have low/high yield -> residuals are negative/positive
xyplot(res~comp, dat, type=c('p','r'))
}
