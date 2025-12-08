# Randomized complete block design for wheat

Randomized complete block design (RCBD) comparing three new wheat
varieties against a standard variety.

## Usage

``` r
data("clewer.wheat")
```

## Format

A data frame with 12 observations on the following 5 variables.

- `row`:

  Row in field, numeric

- `col`:

  Column in field, numeric

- `block`:

  Block factor, 3 levels

- `gen`:

  Variety factor, 4 levels

- `yield`:

  Yield, t/ha

## Details

An experiment to compare three new wheat varieties (V2, V3, V4) with a
standard variety (V1). The experimental area was divided into three
blocks, each containing four plots of equal size. The blocks were
positioned at right angles to a suspected fertility gradient.

This is Example 10.1 from Clewer and Scarisbrick (2001), Chapter 10,
demonstrating the analysis of a randomized complete block design.

The book reports:

ANOVA results:

|         |     |       |      |       |
|---------|-----|-------|------|-------|
| Source  | DF  | SS    | MS   | F     |
| Block   | 2   | 9.78  | 4.89 | 12.22 |
| Variety | 3   | 6.63  | 2.21 | 5.52  |
| Error   | 6   | 2.40  | 0.40 |       |
| Total   | 11  | 18.81 |      |       |

Variety means (t/ha):

|     |      |
|-----|------|
| V1  | 6.50 |
| V2  | 7.60 |
| V3  | 6.60 |
| V4  | 8.30 |

Grand mean: 7.25 t/ha.

Block means: B1=8.50, B2=6.85, B3=6.40 t/ha.

## Source

Clewer, Alan G. and Scarisbrick, David H. (2001). Practical Statistics
and Experimental Design for Plant and Crop Science. Wiley, New York.
Example 10.1, Table 10.1, page 135.

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{

library(agridat)
data(clewer.wheat)
dat <- clewer.wheat

# Field layout
libs(desplot)
desplot(dat, yield ~ col*row,
  out1 = block, text = gen, cex = 1,
  main = "clewer.wheat")

# Verify variety means
aggregate(yield ~ gen, data = dat, FUN = mean)
##   gen yield
## 1  V1  6.50
## 2  V2  7.60
## 3  V3  6.60
## 4  V4  8.30

# RCBD analysis
m1 <- aov(yield ~ block + gen, data = dat)
anova(m1)
## Response: yield
##           Df Sum Sq Mean Sq F value   Pr(>F)
## block      2  9.780  4.8900  12.225 0.007626 **
## gen        3  6.630  2.2100   5.525 0.036692 *
## Residuals  6  2.400  0.4000

# Matches book: Block SS=9.78, Variety SS=6.63, Error SS=2.40, MSE=0.40

# Compare ignoring blocks (CRD analysis)
m0 <- aov(yield ~ gen, data = dat)
anova(m0)
## Response: yield
##           Df  Sum Sq Mean Sq F value Pr(>F)
## gen        3  6.6300  2.2100  1.4517  0.297
## Residuals  8 12.1800  1.5225

# Matches book: Without blocking, VR=1.45, not significant
# Blocking reduced error variance from 1.52 to 0.40

} # }
```
