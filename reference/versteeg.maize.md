# Maize and pigeon pea criss-cross trial in Benin

Maize and pigeon pea criss-cross trial in Benin

## Usage

``` r
data("versteeg.maize")
```

## Format

A data frame with 150 observations on the following 4 variables.

- `farm`:

  farm

- `system`:

  cropping system

- `gen`:

  maize hybrid

- `yield`:

  yield t/ha

## Details

Experiment conducted in 1988 on 25 farms.

Trial objectives: Compare 3 genotypes & compare two cropping systems.
Within each trial, a block 30m x 20m was divided into 3 plots for
genotypes. The block was also divided into 2 portions for the cropping
system. This is called a "strip-plot", "split-block" or "criss-cross
design".

Data provenance: Scanned by iPhone from page 114. Checked by K.Wright.

## Source

Versteeg, M. N. & Huijsman, A. (1991). Trial design and analysis for
onfarm adaptive research: a 1988 maize trial in the Mono Province of
Benin. In On-farm research in theory and practice, eds H. J. W. Mutsaers
& P. Walker.
https://www.google.com/books/edition/On_farm_Research_in_Theory_and_Practice/pyezToHYDHwC?hl=en&gbpv=1&pg=PA111

## References

Mutsaers, H. J. W., G. K. Weber, P. Walker, and N.M. Fischer (1997) A
field guide for on-farm experimentation.
https://archive.org/details/isbn_9781311258/page/n3/mode/1up

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(versteeg.maize)
dat <- versteeg.maize

dat <- transform(dat, farm=as.factor(farm),
 gen=as.factor(gen), system=as.factor(system))

# anova of Versteeg page 115
# plots are different sizes, so we have to manually
# specify the error terms for testing
m1 <- aov(yield ~ 1 + farm + gen + system + gen:system +
 Error(gen:farm + system:farm), data=dat)
summary(m1)

libs(dplyr)
d1 <- summarize(dat, mn=mean(yield), .by=farm)
dat <- left_join(dat, d1)

# stability analysis, figure 1 of Versteeg, page 119
libs(lattice)
xyplot(yield~mn, data=dat, groups=gen, type=c('p','r'))
} # }
```
