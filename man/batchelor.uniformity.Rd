\name{batchelor.uniformity}
\alias{batchelor.apple.uniformity}
\alias{batchelor.lemon.uniformity}
\alias{batchelor.navel1.uniformity}
\alias{batchelor.navel2.uniformity}
\alias{batchelor.valencia.uniformity}
\alias{batchelor.walnut.uniformity}
\docType{data}
\title{
  Uniformity trials of fruit tree yields.
}
\description{
  Uniformity trials of apples, lemons, oranges, and walnuts.
}

\format{
  Each dataset has the following format
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield per tree (pounds)}
  }
}
\details{

  A few of the trees affected by disease were eliminated and the yield
  was replaced by the average of the eight surrounding trees.

  The following details are from Batchelor (1918).

  \bold{Jonathan Apples}

  The apple (Malus sylvestris) records were obtained from a 10-year old
  Jonathan apple orchard located at Providence, Utah. The surface soil
  of this orchard is very uniform to all appearances except on the
  extreme eastern edge, where the percentage of gravel increases
  slightly. The trees are planted 16 feet apart, east and west, and 30
  feet apart north and south.

  \bold{Eureka Lemon}

  The lemon (Citrus limonia) tree yields were obtained from a grove of
  364 23-year-old trees, located at Upland, California. The records
  extend from October 1, 1915, to October 1, 1916. The grove consists of
  14 rows of 23-year-old trees, extending north and south, with 26 trees
  in a row, planted 24 by 24 feet apart. This grove presents the most
  uniform appearance of any under consideration [in this paper]. The
  land is practically level, and the soil is apparently uniform in
  texture. The records show a grouping of several low-yielding trees;
  yet a field observation gives one the impression that the grove as a
  whole is remarkably uniform.

  \bold{Navel 1 (Arlington)}

  These records were of the 1915-16 yields of one thousand 24-year-old
  navel-orange trees near Arlington station, Riverside, California. The
  grove consists of 20 rows of trees from north to south, with 50 trees
  in a row, planted 22 by 22 feet. A study of the records shows certain
  distinct high- and low-yielding areas. The northeast corner and the
  south end contain notably high-yielding trees. The north two-thirds of
  the west side contains a large number of low-yielding trees. These
  areas are apparently correlated with soil variation. Variations from
  tree to tree also occur, the cause of which is not evident. These
  variations, which are present in every orchard, bring uncertainty into
  the results offield experiments.

  \bold{Navel 2 (Antelope)}

  The navel-orange grove later referred to as the Antelope Heights
  navels is a plantation of 480 ten-yearold trees planted 22 by 22 feet,
  located at Naranjo, California. The yields are from 1916. The general
  appearance of the trees gives a visual impression of uniformity
  greater than a comparison of the individual tree production
  substantiates.

  \bold{Valencia Orange}

  The Valencia orange grove is composed of 240 15-year-old trees,
  planted 21 feet 6 inches by 22 feet 6 inches, located at Villa Park,
  California. The yields were obtained in 1916.

  \bold{Walnut}

  The walnut (Juglans regia) yields were obtained during the seasons of
  1915 and 1916 from a 24-year-old Santa Barbara softshell seedling
  grove, located at Whittier, California.
  [Note, The yields here appear to be the 1915 yields.]
  The planting is laid out 10 trees wide and 32 trees long, entirely
  surrounded by additional walnut plantings, except on a part of one
  side which is adjacent to an orange grove. The trees are planted on
  the square system, 50 feet apart.

}
\source{
  Batchelor, LD and Reed, HS. 1918.
  Relation of the variability of yields of fruit trees to the accuracy
  of field trials. \emph{J. Agric. Res}, 12, 245--283.
  \url{http://books.google.com/books?id=Lil6AAAAMAAJ&lr&pg=PA245}.
}
\references{
  McCullagh, P. and Clifford, D., (2006).
  Evidence for conformal invariance of crop yields,
  \emph{Proceedings of the Royal Society A: Mathematical, Physical and
  Engineering Science}, 462, 2119--2143.
}
\examples{

require("agrifun")

# Apple
data(batchelor.apple.uniformity)
desplot(yield~col*row, data=batchelor.apple.uniformity,
        aspect=30/16,
        main="batchelor.apple.uniformity",
        ylab="Jonathon apple tree yields")

# Lemon
data(batchelor.lemon.uniformity)
desplot(yield~col*row, data=batchelor.lemon.uniformity,
        aspect=26/14,
        main="batchelor.lemon.uniformity",
        ylab="Eureka lemon tree yields")

# Navel1 (Arlington)
data(batchelor.navel1.uniformity)
dat <- batchelor.navel1.uniformity
desplot(yield~col*row, dat, aspect=50/20,
        main="batchelor.navel1.uniformity",
        ylab="Navel orange tree yields (Arlington)")

# Navel2 (Antelope)
data(batchelor.navel2.uniformity)
desplot(yield~col*row, data=batchelor.navel2.uniformity,
        aspect=33/15,
        main="batchelor.navel2.uniformity",
        ylab="Navel orange tree yields (Antelope)")

# Valencia
data(batchelor.valencia.uniformity)
desplot(yield~col*row, data=batchelor.valencia.uniformity,
        aspect=20/12,
        main="batchelor.valencia.uniformity",
        ylab="Valencia orange tree yields")

# Walnut
data(batchelor.walnut.uniformity)
desplot(yield~col*row, data=batchelor.walnut.uniformity,
        aspect=32/10,
        main="batchelor.walnut.uniformity",
        ylab="Seedling walnut yields")
}

