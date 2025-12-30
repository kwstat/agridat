# Uniformity trials of soybeans and wheat in artificially constructed frames

Uniformity trials of soybeans and wheat in artificially constructed
frames with homogeneous soil, at West Virginia Agricultural Experiment
Station, 1929-1930.

## Usage

``` r
data("garber.frames.uniformity")
```

## Format

A data frame with 180 observations on the following 7 variables.

- `year`:

  year, 1929 or 1930

- `crop`:

  crop, soybeans or wheat

- `row`:

  row ordinate

- `col`:

  column ordinate = frame/plat number

- `framerow`:

  row within frame

- `yield`:

  yield, grams of hay (soy) or grain (wheat)

- `total`:

  total weight, grams of straw (wheat only)

## Details

At West Virginia Agricultural Experiment Station, concrete "frames"
(walls) were constructed, each 9.33 feet x 4.66 feet, with 6-inch thick
walls, 4 inches tall. Frames were arranged side by side (not end to end)
in a single series. An 8-inch layer of topsoil was removed from each
frame and set to one side. Then another 8-inch layer of subsoil was
removed from each frame and set aside. The subsoil from each frame was
then distributed among all frames. The topsoil from each frame was then
distributed among all frames. In this way, the soil among all frames was
made homogeneous.

Field width: 56 inches \* 30 frames = 1680 inches = 140 feet.

Field length: 112 inches \* 1 frame = 112 inches = 9.33 feet.

In 1929 the frames had 2 rows of soybeans, 28 inches apart. Harvested as
hay. Weight recorded in grams for each frame/row.

In fall of 1929 the frames were planted to winter wheat, 4 rows, 12
inches apart, harvested in 1930. Weight recorded in grams for grain and
total (straw).

Garber says the wheat data showed marked evidence of border effect–the
outer 2 rows within each frame had higher yield than the inner rows. He
used only the inner 2 rows for the anova. The large amount of variation
in the data suggests that factors other than soil variability are the
reason for the variability.

In the paper, 'plat' refers to 'col' (frame number).

Data source: Using pdf of original paper, tables were scanned by iPhone,
then manually formatted and checked by K.Wright.

## Source

Garber, R. J. and W. H. Pierre (1933). Variation of yields obtained in
small artificially constructed field plats. Journal of the American
Society of Agronomy, 25, 98-105.
https://archive.org/details/dli.ernet.27768/page/97/mode/2up

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{

  library(agridat)
  data(garber.frames.uniformity)
  dat <- garber.frames.uniformity

  # Aggregate framerows
  libs(dplyr)
  dat <- group_by(dat, crop, row, col)
  dat <- summarize(dat, yield = sum(yield, na.rm=TRUE),
              total = sum(total, na.rm=TRUE))
  dat <- ungroup(dat)

  libs(desplot)

  # Soybeans 1929
  dat29 <- subset(dat, crop=="soybeans")
  desplot(dat29, yield ~ col*row,
          tick=TRUE, aspect=112/1680,
          main="garber.frames.uniformity - 1929 soybeans")

  # Wheat 1930
  dat30 <- subset(dat, crop=="wheat")
  desplot(dat30, yield ~ col*row,
          tick=TRUE, aspect=112/1680,
          main="garber.frames.uniformity - 1930 wheat (grain)")
  
  # correlation
  cor(dat29$yield, dat30$total) # -.186 matches Garber p 101
  plot(dat29$yield, dat30$yield,
       xlab="1929 soybeans yield (g)",
       ylab="1930 wheat yield (g)",
       main="garber.frames.uniformity\n1929 soy vs 1930 wheat")
} # }
```
