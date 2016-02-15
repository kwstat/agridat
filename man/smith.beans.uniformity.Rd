\name{smith.beans.uniformity}
\alias{smith.beans1.uniformity}
\alias{smith.beans2.uniformity}
\alias{smith.beans3.uniformity}
\alias{smith.beans4.uniformity}
\docType{data}
\title{
  Uniformity trials of beans, 2 species in 2 years
}
\description{
  Uniformity trials of beans at California, 1954-1955, 2 species in 2 years
}
\usage{data("smith.beans1.uniformity")}
\format{
  A data frame with 216 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, kg}
  }
}
\details{
  
  Trials were conducted in California.
  In 1955 plots were twice as wide and twice as long as in 1954. 
  Red Kidney is a bush variety bean, Standard Pink is a viny variety.

  Smith randomly assigned A,B,C,D to plots and used these as 'varieties'
  for calculating ANOVA tables.  Plots were combined side-by-side and
  end-to-end to make larger plots. Decreasing LSDs were observed for
  increases in plot sizes.  LSDs were seldom above 200, which was
  considered to be a noticeable difference for the farmers.

  There are four datasets:

  \bold{1954}
  
  beans1: Red Kidney, beans2: Standard Pink

  Field width: 18 plots * 30 inches = 45 ft
  
  Field height: 12 plots * 15 ft = 180 ft

  \bold{1955}
  
  beans3: Red Kidney, beans4: Standard Pink

  Field width: 16 plots * 2 rows * 30 in = 80 ft

  Field height: 15 plots * 30 ft = 450 ft
  
}
\source{
  
  Francis L. Smith, 1958.
  Effects of plot size, plot shape, and number of replications on the
  efficacy of bean yield trials.
  \emph{Hilgardia}, 28, 43-63.
  http://doi.org/10.3733/hilg.v28n02p043
  
}
\references{
  None.
}
\examples{
data(smith.beans1.uniformity)
data(smith.beans2.uniformity)
data(smith.beans3.uniformity)
data(smith.beans4.uniformity)

cv <- function(x) { sd(x)/mean(x) }
cv(smith.beans1.uniformity$yield)
cv(smith.beans2.uniformity$yield) # Does not match Smith. Checked all values by hand.
cv(smith.beans3.uniformity$yield)
cv(smith.beans4.uniformity$yield)

if(require("desplot")){
  desplot(yield ~ col*row, smith.beans1.uniformity,
    aspect=180/45, flip=TRUE, # true aspect
    main="smith.beans1.uniformity (true aspect)")
  desplot(yield ~ col*row, smith.beans2.uniformity,
    aspect=180/45, flip=TRUE, # true aspect
    main="smith.beans2.uniformity (true aspect)")
  desplot(yield ~ col*row, smith.beans3.uniformity,
    aspect=450/80, flip=TRUE, # true aspect
    main="smith.beans3.uniformity (true aspect)")
  desplot(yield ~ col*row, smith.beans4.uniformity,
    aspect=450/80, flip=TRUE, # true aspect
    main="smith.beans4.uniformity (true aspect)")
}
}

\keyword{datasets}
