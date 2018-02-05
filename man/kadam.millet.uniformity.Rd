\name{kadam.millet.uniformity}
\alias{kadam.millet.uniformity}
\docType{data}
\title{
  Uniformity trial of millet
}
\description{
  Uniformity trial of millet in India during 2 years
}
\usage{data("kadam.millet.uniformity")}
\format{
  A data frame with 240 observations on the following 4 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, ounces}
  }
}
\details{

  Uniformity trials conducted during the kharip (monsoon) seasons of
  1933 and 1934 at Kundewadi, Niphad, in the district of Nasik,
  India. Bajari (pearl millet) strain 54 was used.

  In 1933:
  
  Field width: 8 plots * 16.5 feet
  
  Field length: 10 plots * 33 feet
  
  In 1934:
  
  Field width: 8 plots * 16.5 feet

  Field length: 20 plots * 16.5 feet
  
}
\source{
  B. S. Kadam and S. M. Patel. (1937).
  Studies in Field-Plot Technique With P. Typhoideum Rich.
  The Empire Journal Of Experimental Agriculture, 5, 219-230.
  https://archive.org/details/in.ernet.dli.2015.25282
}
\references{
  None.
}
\examples{
data(kadam.millet.uniformity)

# similar to Kadam fig 1
dat1 <- subset(kadam.millet.uniformity, year==1933)
if(require(desplot)){
  desplot(yield ~ col*row, dat1, flip=TRUE,
          aspect=(10*33)/(8*16.5), # true aspect
          main="kadam.millet.uniformity 1933")
}

dat2 <- subset(kadam.millet.uniformity, year==1934)
if(require(desplot)){
  desplot(yield ~ col*row, dat2, flip=TRUE,
          aspect=(20*16.5)/(8*16.5), # true aspect
          main="kadam.millet.uniformity 1934")
}

}
\keyword{datasets}
