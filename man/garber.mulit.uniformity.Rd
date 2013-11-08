\name{garber.multi.uniformity}
\alias{garber.multi.uniformity}
\docType{data}
\title{
  Uniformity trials of oat hay and wheat
}
\description{
  Uniformity trials of oat straw and wheat
}

\format{
  A data frame with 270 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{oats}}{yield of oat hay}
    \item{\code{wheat}}{yield of wheat grain}
  }
}
\details{
  In 1923 the field was planted to oats and harvested as hay.  In 1924
  the field was planted to wheat and harvested for grain.
  
  Garber: "Plots 211 to 214, and 261 to 264, [note, these are rows
  11-14, columns 5-6] inclusive, were eliminated from this study because
  of the fact that a few years ago a straw stack had stood on or in the
  vicinity...which undoubtedly accounts for the relatively high yields
  on plots 261 to 264, inclusive."

  Note: The source document contained mean-subtracted yields.  The oat
  yield in row 22, column 5 was given as +59.7.  This is obviously
  incorrect, since the negative yields all end in '.7' and positive
  yields all ended in '.3'.  We used -59.7 as the centered yield value
  and added the mean of 1883.7 to all centered yields to obtain absolute
  yields.
}
\source{
  Garber, RJ and Mcllvaine, TC and Hoover, MM. 1926.
  A study of soil heterogeneity in experiment plots.
  \emph{Jour. Agr. Res}, 33, 255-268.
  \url{http://naldc.nal.usda.gov/download/IND43967148/PDF}.
}

\examples{

dat <- garber.multi.uniformity

desplot(oats ~ col*row, data=dat, flip=TRUE, tick=TRUE,
        main="garber.multi.uniformity oats")
desplot(wheat ~ col*row, data=dat, flip=TRUE, tick=TRUE,
        main="garber.multi.uniformity wheat")
with(dat, cor(oats, wheat)) # = .37 matches Garber

}
\keyword{datasets}
