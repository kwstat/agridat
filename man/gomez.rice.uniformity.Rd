\name{gomez.rice.uniformity}
\alias{gomez.rice.uniformity}
\docType{data}
\title{
  Uniformity trial of rice
}
\description{
  Uniformity trial of rice
}

\format{
  A data frame with 648 observations on the following 3 variables.
  \describe{
    \item{\code{yield}}{grain yield in g/m^2}
    \item{\code{x}}{column}
    \item{\code{y}}{row}
  }
}

\details{
  An area 20 meters by 38 meters was planted to rice variety IR8.  At
  harvest, a 1-meter border was removed around the field and discarded.
  Each square meter (1 meter by 1 meter) was harvested and weighed.
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 481.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.rice.uniformity)
dat <- gomez.rice.uniformity

if(require(agricolae) & require(desplot) & require(reshape2)){
  # Raw data plot
  desplot(yield ~ x*y, data=dat, aspect=38/20,
          main="gomez.rice.uniformity")

  # 3x3 moving average.  Gomez figure 12.1
  dmat <- melt(dat, id.var=c('x','y'))
  dmat <- acast(dmat, y~x)
  m0 <- dmat
  cx <- 2:17
  rx <- 2:35
  dmat3 <- (m0[rx+1,cx+1]+m0[rx+1,cx]+m0[rx+1,cx-1]+
              m0[rx,cx+1]+m0[rx,cx]+m0[rx,cx-1]+
              m0[rx-1,cx+1]+m0[rx-1,cx]+m0[rx-1,cx-1])/9
  dat3 <- melt(dmat3)
  desplot(value~Var2*Var1, dat3, aspect=38/20,
          at=c(576,637,695,753,811,870,927),
        main="gomez.rice.uniformity smoothed")
  
  # Gomez table 12.4
  tab <- index.smith(dmat, col="red")$uniformity
  tab <- data.frame(tab)
  
  # Gomez figure 12.2
  op <- par(mar=c(5,4,4,4)+.1)
  m1 <- nls(Vx ~ 9041/Size^b, data=tab, start=list(b=1))
  plot(Vx ~ Size, tab, xlab="Plot size, m^2")
  lines(fitted(m1) ~ tab$Size, col='red')
  axis(4, at=tab$Vx, labels=tab$CV)
  mtext("CV", 4, line=2)
  par(op)
}

}
