# Load multiple packages and install if needed

Install and load packages "on the fly".

## Usage

``` r
libs(...)
```

## Arguments

- ...:

  Comma-separated unquoted package names

## Value

None

## Details

The 'agridat' package uses dozens of packages in the examples for each
dataset. The 'libs' function provides a simple way to load multiple
packages at once, and can install any missing packages on-the-fly.

This is very similar to the \`pacman::p_load\` function.

## References

None

## Author

Kevin Wright

## Examples

``` r
if (FALSE) { # \dontrun{
libs(dplyr,reshape2)
} # }
```
