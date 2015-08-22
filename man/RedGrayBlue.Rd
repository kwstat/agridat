\name{RedGrayBlue}
\alias{RedGrayBlue}
\title{
  Function to create a Red-Gray-Blue palette
}

\description{
  Function to create a Red-Gray-Blue palette
}

\usage{
  RedGrayBlue(n)
}
\arguments{
  \item{n}{Number of colors to create}
}
\details{
  A function to create a Red-Gray-Blue palette.

  Using gray instead of white allows missing values to appear as white
  (actually, transparent).

  The 'coolwarm' palette by Kenneth Mooreland came later and added a bit
  more color to the red and blue, and reversed the scale.
}
\references{
  Kenneth Moreland. (2009).
  "Diverging Color Maps for Scientific Visualization." In Proceedings of
  the 5th International Symposium on Visual Computing, December 2009. 
  \url{http://kennethmoreland.com/color-maps/}
}

\value{
  A vector of n colors.
}
\examples{
pie(rep(1,11), col=RedGrayBlue(11))
title("RedGrayBlue(11)")
}
