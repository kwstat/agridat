\name{durban.rowcol}
\alias{durban.rowcol}
\docType{data}
\title{
  Row-column experiment of spring barley, many varieties
}
\description{
  Row-column experiment of spring barley, many varieties
}

\format{
  A data frame with 544 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{bed}}{bed (column)}
    \item{\code{rep}}{rep, 2 levels}
    \item{\code{gen}}{genotype, 272 levels}
    \item{\code{yield}}{yield, tonnes/ha}
  }
}
\details{
  Spring barley variety trial of 272 entries (260 new varieties, 12
  control). Grown at the Scottish Crop Research Institute in 1998.
  Row-column design with 2 reps, 16 rows (north/south) by 34 beds
  (east/west).
  The land sloped downward from row 16 to row 1.  Plot yields were
  converted to tonnes per hectare.

  Plot dimensions are not given.
  
  Retrieved from: ftp://ftp.bioss.sari.ac.uk/pub/maria

  Used with permission of Maria Durban.
}
\source{
  Durban, Maria and Hackett, Christine and McNicol, James and
  Newton, Adrian and Thomas, William and Currie, Iain. 2003.
  The practical use of semiparametric models in field trials,
  Journal of Agric Biological and Envir Stats, 8, 48-66.
  https://doi.org/10.1198/1085711031265
}
\references{
  Edmondson, Rodney (2020).
  Multi-level Block Designs for Comparative Experiments.
  J of Agric, Biol, and Env Stats.
  https://doi.org/10.1007/s13253-020-00416-0
}
\examples{
\dontrun{

  library(agridat)
  data(durban.rowcol)
  dat <- durban.rowcol
  
  libs(desplot)
  desplot(dat, yield~bed*row,
          out1=rep, num=gen, # aspect unknown
          main="durban.rowcol")
  

  # Durban 2003 Figure 1
  m10 <- lm(yield~gen, data=dat)
  dat$resid <- m10$resid
  ## libs(lattice)
  ## xyplot(resid~row, dat, type=c('p','smooth'), main="durban.rowcol")
  ## xyplot(resid~bed, dat, type=c('p','smooth'), main="durban.rowcol")
  
  # Figure 3
  libs(lattice)
  xyplot(resid ~ bed|factor(row), data=dat,
         main="durban.rowcol",
         type=c('p','smooth'))
  
  

  # Figure 5 - field trend
  # note, Durban used gam package like this
  # m1lo <- gam(yield ~ gen + lo(row, span=10/16) + lo(bed, span=9/34), data=dat)
  libs(mgcv)
  m1lo <- gam(yield ~ gen + s(row) + s(bed, k=5), data=dat)
  new1 <- expand.grid(row=unique(dat$row),bed=unique(dat$bed))
  new1 <- cbind(new1, gen="G001")
  p1lo <- predict(m1lo, newdata=new1)
  libs(lattice)
  wireframe(p1lo~row+bed, new1, aspect=c(1,.5), main="Field trend")


  libs(asreml) # asreml4

  dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
  dat <- dat[order(dat$rowf, dat$bedf),]

  m1a1 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
                 random=~spl(rowf) + spl(bedf) + units,
                 family=asr_gaussian(dispersion=1))
  m1a2 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
                 random=~spl(rowf) + spl(bedf) + units,
                 resid = ~ar1(rowf):ar1(bedf))
  m1a2 <- update(m1a2)
  m1a3 <- asreml(yield~gen, data=dat, random=~units,
                 resid = ~ar1(rowf):ar1(bedf))

  # Figure 7
  libs(lattice)
  v7a <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a3$residuals)
  wireframe(gamma ~ x*y, v7a, aspect=c(1,.5)) # Fig 7a
  
  v7b <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a2$residuals)
  wireframe(gamma ~ x*y, v7b, aspect=c(1,.5)) # Fig 7b
  
  v7c <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1lo$residuals)
  wireframe(gamma ~ x*y, v7c, aspect=c(1,.5)) # Fig 7c

}
}

