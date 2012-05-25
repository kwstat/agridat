\name{panel.outlinelevelplot}

\alias{panel.outlinelevelplot}

\title{
  Panel Function for desplot
}

\description{
  This is a panel function for \code{desplot} which fills cells with
  a background color and adds outlines around blocks of cells.
}
\usage{
panel.outlinelevelplot(x, y, z, subscripts, at, ...,
alpha.regions = 1, out1f, out1g, out2f, out2g)
}
\arguments{
  \item{x,y}{ Coordinates}
  \item{z}{Value for filling each cell}
  \item{subscripts}{For compatability}
  \item{at}{Breakpoints for the colors}
  \item{\dots}{Other}
  \item{alpha.regions}{Transparency for fill colors. Not well tested.}
  \item{out1f, out2f}{Factors to use for outlining.}
  \item{out1g, out2g}{Graphics parameters to use for outlining.}
}
\details{
  This is a panel function for \code{desplot} which fills cells with
  a background color and adds outlines around blocks of cells.

  It does not add the text labels, numbers, or colors.

  The rule for determining where to draw outlines is to compare the
  levels of the factor used for outlining.  If bordering cells have
  different levels of the factor, then a border is drawn.  'NA' values
  are ignored (otherwise, too many lines would be drawn).

  The code works, but is probably overkill and has not been streamlined.
}
\value{
  None
}
\author{
  Kevin Wright.  Derived from \code{panel.levelplot}.
}