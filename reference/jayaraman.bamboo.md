# Bamboo progeny trial in India

Bamboo progeny trial in 2 locations, 3 blocks

## Usage

``` r
data("jayaraman.bamboo")
```

## Format

A data frame with 216 observations on the following 5 variables.

- `loc`:

  location factor

- `block`:

  block factor

- `family`:

  family factor

- `tree`:

  tree factor

- `height`:

  height, cm

## Details

Data from a replicated trial of bamboo at two locations in Kerala,
India. Each location had 3 blocks. In each block were 6 families, with 6
trees in each family.

Note: The data in `jayaraman.bamboo.uncorrected` is the same as
`jayaraman.bamboo` except that the former has not been corrected for a
data entry error in the `tree` variable. Thanks to Roger Stern for
pointing out the error. The 'uncorrected' data is included for
illustration purposes only, and should not be used for analysis.

## Source

K. Jayaraman (1999). "A Statistical Manual For Forestry Research".
Forestry Research Support Programme for Asia and the Pacific. Section
6.1, Page 170. https://openknowledge.fao.org/handle/20.500.14283/x6831e

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(jayaraman.bamboo)
  dat <- jayaraman.bamboo

  # very surprising differences between locations
  libs(lattice)
  bwplot(height ~ family|loc, dat, main="jayaraman.bamboo")
  # match Jayarman's anova table 6.3, page 173
  # m1 <- aov(height ~ loc+loc:block + family + family:loc +
  #  family:loc:block, data=dat)
  # anova(m1)

  # more modern approach with mixed model, match variance components needed
  # for equation 6.9, heritability of the half-sib averages as
  m2 <- lme4::lmer(height ~ 1 + (1|loc/block) + (1|family/loc/block), data=dat)
  lucid::vc(m2)
} # }
```
