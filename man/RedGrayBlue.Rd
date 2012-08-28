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
  Function to create a Red-Gray-Blue palette.  Using gray instead of
  white allows missing values to appear as white (transparent).
}
\value{
  A vector of n colors.
}
\examples{
pie(rep(1,11), col=RedGrayBlue(11))
}