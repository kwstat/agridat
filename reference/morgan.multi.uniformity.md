# Uniformity trial of wheat and corn

Uniformity trial of wheat and corn

## Usage

``` r
data("morgan.multi.uniformity")
```

## Format

A data frame with 63 observations on the following 3 variables.

- `plot`:

  plot ordinate

- `wheat`:

  wheat yield

- `cornfodder`:

  corn fodder yield

## Details

A plat 112.5 feet wide by 945 feet long at Cornell University. Plats 15
feet long were harvest separately. Wheat harvested summer 1908.
Re-planted to corn, harvested Sept 28 for fodder. The data given in
Morgan (1907) are relative yields, which we converted to absolute yields
based on the minimum and maximum yields reported.

Morgan: "We can see that one crop alone cannot be depended upon to
determine the relative productiveness of a series of plats."

## Source

Morgan, J. Oscar (1907) Some Experiments to Determine the Uniformity of
Certain Plats for Field Tests. Agronomy Journal, 1, 58-67.
https://doi.org/10.2134/agronj1907-1909.00021962000100010015x

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(morgan.multi.uniformity)
  dat <- morgan.multi.uniformity
  dat$col = 1

  libs(desplot)
  desplot(dat, wheat ~ col*plot,
          aspect=945/112.5,
          main="morgan.multi.uniformity: wheat yield")
  desplot(dat, cornfodder ~ col*plot,
          aspect=945/112.5,
          main="morgan.multi.uniformity: corn fodder yield")
  plot(dat$wheat, dat$cornfodder,
       xlab="Wheat yield (bu/a)",
       ylab="Corn fodder yield (bu/a)",
       main="morgan.multi.uniformity")
} # }
```
