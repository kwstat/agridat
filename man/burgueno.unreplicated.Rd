\name{burgueno.unreplicated}
\alias{burgueno.unreplicated}
\docType{data}
\title{
  Field experiment with unreplicated genotypes plus one repeated check.
}

\description{
  Field experiment with unreplicated genotypes plus one repeated check.
}

\usage{data("burgueno.unreplicated")}

\format{
  A data frame with 434 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype, 281 levels}
    \item{\code{col}}{column}
    \item{\code{row}}{row}
    \item{\code{yield}}{yield, tons/ha}
  }
}

\details{
  A field experiment with 280 new genotypes.  A check genotype is
  planted in every 4th column.

  The plot size is not given.

  Electronic version of the data obtained from CropStat software.

  Used with permission of Juan Burgueno.

}

\source{
  J Burgueno, A Cadena, J Crossa, M Banziger, A Gilmour, B Cullis (2000).
  User's guide for spatial analysis of field variety trials using ASREML.
  CIMMYT.
}

\examples{
\dontrun{

  library(agridat)
  data(burgueno.unreplicated)
  dat <- burgueno.unreplicated

  # Define a 'check' variable for colors
  dat$check <- ifelse(dat$gen=="G000", 2, 1)
  # Every fourth column is the 'check' genotype
  libs(desplot)
  desplot(dat, yield ~ col*row,
          col=check, num=gen, #text=gen, cex=.3, # aspect unknown
          main="burgueno.unreplicated")

  libs(asreml,lucid)
  if( utils::packageVersion("asreml") < "4") {
    # asreml3
    
    # AR1 x AR1 with random genotypes
    dat <- transform(dat, xf=factor(col), yf=factor(row))
    dat <- dat[order(dat$xf,dat$yf),]
    m2 <- asreml(yield ~ 1, data=dat, random = ~ gen,
                 rcov = ~ ar1(xf):ar1(yf))
    lucid::vc(m2)
    # Note the strong saw-tooth pattern in the variogram.  Seems to
    # be column effects.
    plot(variogram(m2), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
         main="burgueno.unreplicated - AR1xAR1")
    # libs(lattice) # Show how odd columns are high
    # bwplot(resid(m2) ~ col, data=dat, horizontal=FALSE)
    
    # Define an even/odd column factor as fixed effect
    # dat$oddcol <- factor(dat$col %% 2)
    # The modulus operator throws a bug, so do it the hard way.
    dat$oddcol <- factor(dat$col - floor(dat$col / 2) *2 )
    
    m3 <- update(m2, yield ~ 1 + oddcol)
    m3$loglik # Matches Burgueno table 3, line 3
    plot(variogram(m3), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
         main="burgueno.unreplicated - AR1xAR1 + Even/Odd")
    # Much better-looking variogram

  }

  libs(asreml,lucid)
    if( utils::packageVersion("asreml") > "4") {
    # asreml4

    # AR1 x AR1 with random genotypes
    dat <- transform(dat, xf=factor(col), yf=factor(row))
    dat <- dat[order(dat$xf,dat$yf),]
    m2 <- asreml(yield ~ 1, data=dat, random = ~ gen,
                 resid = ~ ar1(xf):ar1(yf))
    vc(m2)
    ##       effect component std.error z.ratio bound %ch
    ##          gen    0.9122   0.127       7.2     P 0  
    ##     xf:yf(R)    0.4993   0.05601     8.9     P 0  
    ## xf:yf!xf!cor   -0.2431   0.09156    -2.7     U 0  
    ## xf:yf!yf!cor    0.1255   0.07057     1.8     U 0.1
    
    # Note the strong saw-tooth pattern in the variogram.  Seems to
    # be column effects.
    plot(varioGram(m2), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
         main="burgueno.unreplicated - AR1xAR1")
    # libs(lattice) # Show how odd columns are high
    # bwplot(resid(m2) ~ col, data=dat, horizontal=FALSE)
    
    # Define an even/odd column factor as fixed effect
    # dat$oddcol <- factor(dat$col %% 2)
    # The modulus operator throws a bug, so do it the hard way.
    dat$oddcol <- factor(dat$col - floor(dat$col / 2) *2 )
    
    m3 <- update(m2, yield ~ 1 + oddcol)
    m3$loglik # Matches Burgueno table 3, line 3
    
    plot(varioGram(m3), xlim=c(0,15), ylim=c(0,9), zlim=c(0,0.5),
         main="burgueno.unreplicated - AR1xAR1 + Even/Odd")
    # Much better-looking variogram
    
}
}
}

\keyword{datasets}
