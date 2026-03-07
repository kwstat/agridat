# Graeco-Latin experiment with maize

Graeco-Latin experiment with maize

## Usage

``` r
data("onyiah.maize")
```

## Format

A data frame with 20 observations on the following 5 variables.

- `loc`:

  location

- `gen`:

  maize genotype

- `greek`:

  spacing

- `latin`:

  fertilizer level

- `yield`:

  yield per hectare

## Details

In a multi-location variety trial of maize, there were two additional
treatment factors: spacing (greek) and fertilizer (Latin).

Data provenance: Typed by K.Wright.

## Source

Leonard C. Onyiah (2008). Design and Analysis of Experiments: Classical
and Regression Approaches with SAS.
https://books.google.com/books?id=\_P3LBQAAQBAJ&pg=PA334

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(onyiah.maize)
  dat <- onyiah.maize
  
  # anova
  dat <- transform(dat, loc=factor(loc), gen=factor(gen),
                   greek=factor(greek), latin=factor(latin))
  m1 <- aov(yield ~ loc + gen + greek + latin, data=dat)
  anova(m1)
  
} # }
```
