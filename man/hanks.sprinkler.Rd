\name{hanks.sprinkler}
\alias{hanks.sprinkler}
\docType{data}
\title{
  Wheat yields in a line-source sprinkler experiment
}
\description{
  Three wheat varieties planted in 3 blocks, with a line sprinkler
  crossing all whole plots.
}

\format{
  A data frame with 108 observations on the following 7 variables.
  \describe{
    \item{\code{block}}{Block factor}
    \item{\code{row}}{Row ordinate}
    \item{\code{subplot}}{Column ordinate}
    \item{\code{gen}}{Genotype factor, 3 levels}
    \item{\code{yield}}{Yield (tons/ha)}
    \item{\code{irr}}{Irrigation level, 1..6}
    \item{\code{dir}}{Factor for direction from sprinkler, N/S}
  }
}
\details{
  A line-source sprinkler is placed through the middle of the experiment
  (between subplots 6 and 7).  Subplots closest to the sprinkler receive
  the most irrigation.  Subplots far from the sprinkler (near the edges)
  have the lowest yields.

  One data value was modified from the original (following
  the example of other authors).
}
\source{
  Hanks, R.J., Sisson, D.V., Hurst, R.L, and Hubbard K.G. (1980).
  Statistical Analysis of Results from Irrigation Experiments Using the
  Line-Source Sprinkler System.
  \emph{Soil Science Society of America Journal}, 44, 886-888.
  \url{http://doi.org/10.2136/sssaj1980.03615995004400040048x}
}
\references{
  Johnson, D. E., Chaudhuri, U. N., and Kanemasu, E. T. (1983).
  Statistical Analysis of Line-Source Sprinkler Irrigation Experiments
  and Other Nonrandomized Experiments Using Multivariate Methods.
  \emph{Soil Science Society American Journal}, 47, 309-312.

  Stroup, W. W. (1989).
  Use of Mixed Model Procedure to Analyze Spatially Correlated Data: An
  Example Applied to a Line-Source Sprinkler Irrigation Experiment.
  \emph{Applications of Mixed Models in Agriculture and Related
    Disciplines, Southern Cooperative Series Bulletin No. 343}, 104-122.

  SAS Stat User's Guide.
  \url{http://support.sas.com/documentation/cdl/en/statug/63347/HTML/default/viewer.htm#statug_mixed_sect038.htm}
}

\examples{

data(hanks.sprinkler)
dat <- hanks.sprinkler

# The line sprinkler is vertical between subplots 6 & 7
desplot(yield~subplot*row, dat, out1=block, out2=irr, cex=1,
        num=gen, main="hanks.sprinkler")

require(lattice)
xyplot(yield~subplot|block, dat, type=c('b'), group=gen,
       layout=c(1,3), auto.key=TRUE,
       main="hanks.sprinkler",
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.abline(v=6.5, col='wheat')
       })

\dontrun{

## This is the model from the SAS documentation
## proc mixed;
## class block gen dir irr;
## model yield = gen|dir|irr@2;
## random block block*dir block*irr;
## repeated / type=toep(4) sub=block*gen r;

dat <- transform(dat, subf=factor(subplot),
                 irrf=factor(irr))
dat <- dat[order(dat$block, dat$gen, dat$subplot),]

# Reproduced with asreml
require(asreml)
m1 <- asreml(yield ~ gen + dir + irrf + gen:dir + gen:irrf + dir:irrf,
             data=dat,
             random= ~ block + block:dir + block:irrf,
             rcov= ~ block:gen:corb(subf, k=3))

require(lucid)
vc(m1)
##                effect component std.error z.ratio constr
##       block!block.var  0.2194     0.2393     0.92    pos
##   block:dir!block.var  0.01768    0.03154    0.56    pos
##  block:irrf!block.var  0.03539    0.03617    0.98    pos
##            R!variance  0.285      0.05086    5.6     pos
##                R!cor1  0.02802    0.1143     0.25  uncon
##                R!cor2  0.005095   0.1278     0.04  uncon
##                R!cor3 -0.3246     0.0905    -3.6   uncon

## # convert asreml correlations to SAS covariances
## round(.2850 * c(1, .02802, .005095, -.3246),4) # res var * (cor1, cor2, cor3)
## [1]  0.2850  0.0080  0.0015 -0.0925

}
}

