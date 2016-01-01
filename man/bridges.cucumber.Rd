\name{bridges.cucumber}
\alias{bridges.cucumber}
\docType{data}
\title{
  Cucumber yields in latin square design.
}
\description{
  Cucumber yields in latin square design at two locs.
}

\format{
  A data frame with 32 observations on the following 5 variables.
  \describe{
    \item{\code{loc}}{Loc factor}
    \item{\code{gen}}{Cultivar factor}
    \item{\code{row}}{Row position}
    \item{\code{col}}{Column position}
    \item{\code{yield}}{Weight of marketable fruit per plot}
  }
}
\details{
  Conducted at Clemson University in 1985.  four cucumber cultivars
  were grown in a latin square design at Clemson, SC, and Tifton, GA.

  Separate variances are modeled each location.
}
\source{
  William Bridges, 1989. Analysis of a plant breeding experiment with
  heterogeneous variances using mixed model equations.
  \emph{Applications of mixed models in agriculture and related
    disciplines, S. Coop. Ser. Bull}, 45--51.

  Used with permission of William Bridges.
}

\examples{

data(bridges.cucumber)
dat <- bridges.cucumber
dat <- transform(dat, rowf=factor(row), colf=factor(col))

if(require(desplot)){
desplot(yield~col*row|loc, data=dat, text=gen, cex=1,
        main="bridges.cucumber")
}

\dontrun{
require(asreml)
## Random row/col/resid. Same as Bridges 1989, p. 147
m1 <- asreml(yield ~ 1 + gen + loc + loc:gen,
             random = ~ rowf:loc + colf:loc, data=dat)

require(lucid)
vc(m1)
##             effect component std.error z.ratio constr
##  rowf:loc!rowf.var     31.62     23.02     1.4    pos
##  colf:loc!colf.var     18.08     15.32     1.2    pos
##         R!variance     31.48     12.85     2.4    pos

## Random row/col/resid at each loc. Matches p. 147
m2 <- asreml(yield ~ 1 + gen + loc + loc:gen,
             random = ~ at(loc):rowf + at(loc):colf, data=dat,
             rcov = ~at(loc):units)
vc(m2)
##                          effect component std.error z.ratio constr
##  at(loc, Clemson):rowf!rowf.var     32.32    36.58     0.88    pos
##   at(loc, Tifton):rowf!rowf.var     30.92    28.63     1.1     pos
##  at(loc, Clemson):colf!colf.var     22.55    28.78     0.78    pos
##   at(loc, Tifton):colf!colf.var     13.62    14.59     0.93    pos
##            loc_Clemson!variance     46.85    27.05     1.7     pos
##             loc_Tifton!variance     16.11     9.299    1.7     pos

predict(m2, classify='loc:gen')$predictions$pvals
##     loc      gen Predicted Std Err    Status
## Clemson   Dasher     45.55   5.043 Estimable
## Clemson Guardian     31.62   5.043 Estimable
## Clemson Poinsett     21.42   5.043 Estimable
## Clemson   Sprint     25.95   5.043 Estimable
##  Tifton   Dasher     50.48   3.894 Estimable
##  Tifton Guardian     38.72   3.894 Estimable
##  Tifton Poinsett     33.01   3.894 Estimable
##  Tifton   Sprint     39.18   3.894 Estimable
}
}

