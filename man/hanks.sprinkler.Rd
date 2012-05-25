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
\usage{hanks.sprinkler}
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
  \url{https://www.soils.org/publications/sssaj/abstracts/44/4/SS0440040886}
}
\references{
  Johnson, D. E., Chaudhuri, U. N., and Kanemasu, E. T. (1983).
  Statistical Analysis of Line-Source Sprinkler Irrigation Experiments
  and Other Nonrandomized Experiments Using Multivariate Methods.
  \emph{Soil Science Society American Journal}, 47, 309-312.
  
  Stroup, W. W. (1989).
  Use of Mixed Model Procedure to Analyze Spatially Correlated Data: An
  Example Applied to a Line-Source Sprinkler Irrigation Experiment.
  \emph{Applications of Mixed Models in Agriculture and Related Disciplines, Southern Cooperative Series Bulletin No. 343}, 104-122. 

  SAS Stat User's Guide.
  \url{http://support.sas.com/documentation/cdl/en/statug/63347/HTML/default/viewer.htm#statug_mixed_sect038.htm}
}
\examples{
dat <- hanks.sprinkler

# The line sprinkler is vertical between subplots 6 & 7
desplot(yield~subplot*row, dat, out1=block, out2=irr, cex=1,
        num=gen)

xyplot(yield~subplot|block, dat, type=c('b'), group=gen,
       layout=c(1,3), auto.key=TRUE,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.abline(v=6.5, col='wheat')
       })

\dontrun{

# This is the model from the SAS documentation
# proc mixed;
# class block gen dir irr;
# model yield = gen|dir|irr@2;
# random block block*dir block*irr;
# repeated / type=toep(4) sub=block*gen r;

dat <- transform(dat, subf=factor(subplot),
                 irrf=factor(irr))
dat <- dat[order(dat$block, dat$gen, dat$subplot),]

# Re-produced with asreml
require('asreml')
m1 <- asreml(yield ~ gen + dir + irrf + gen:dir + gen:irrf + dir:irrf,
             data=dat,
             random= ~ block + block:dir + block:irrf,
             rcov= ~ block:gen:corb(subf, k=3))
# convert asreml correlations to SAS covariances
summary(m1)$varcomp
.2850 * c(1, .02802, .005095, -.3246) # res var * (cor1, cor2, cor3)

}
}

