# Multi-environment trials of barley and wheat

Multi-environment trials of barley and wheat in Minnesota in 1930s.

## Usage

``` r
data("immer.mets")
```

## Format

A data frame with 255 observations on the following 6 variables.

- `crop`:

  crop: barley or wheat

- `year`:

  1931, 1932, 1935

- `loc`:

  location

- `gen`:

  genotype

- `rep`:

  replication block

- `yield`:

  yield, bu/ac

## Details

Barley data ———-

Multienviroment trials with 4 locs, 4 varieties, 3 reps, 2 years (1932,
1935).

Immer (1950) said the 1932 data were used because 1933 and 1934 were
drought years with low yield.

The StPaul location is called "Univ. Farm" (University Farm) in the
source document.

The barley data is from LeClerg (1962, p 217), Hayes et al. (1942) or
Immer (1950).

Data provenance: K.Wright prepared the electronic data from page 340 of
Hays (1942).

Wheat data ———-

Multienviroment trials with 3 locs, 5 varieties, 3 reps, 3 years (1931,
1932, 1935).

The value for 1935, StPaul, Hope, Rep 2 is 24.5 (not 21.7 as in the
source) based on the totals.

The source document has "U.Farm" (University Farm) which is called
"StPaul" here.

The wheat rep numbers are R1, R2, R3 in the source document, but are
changed to R01, R02, R03 here to emphasize the wheat and barley are
(almost certainly) in different replicates.

The wheat data is from LeClerg et al (1962).

Data provenance: K.Wright prepared the data from page 234 of LeClerg et
al. (1962).

## Source

Erwin LeClerg, Warren Leonard, Andrew Clark (1962). Field Plot
Technique. https://archive.org/details/fieldplottechniq0000lecl

## References

Hayes, Herbert & Forrest Immer (1942). Methods of Plant Breeding
https://archive.org/details/in.ernet.dli.2015.200783/page/n359/mode/2up

Immer, Forrest (1950). Applied Statistis: A Series of Lectures in the
Graduate School of the University of Minnesota. Burgess Publishing
Company, Minneapolis, Minnesota. p. 16

## Examples

``` r
library(agridat)
data(immer.mets)

# Yield totals match LeClerg
# sum(subset(immer.mets, crop=="barley")$yield)
# sum(subset(dat, crop=="wheat")$yield) 

datb <- subset(immer.mets, crop=="barley")
datb <- transform(datb, year=factor(year), loc=factor(loc),
                  gen=factor(gen), rep=factor(rep))
# Full anova. Match Immer p 22
m1 <- aov(yield ~ rep + loc + year + gen + gen:loc + gen:year + gen:loc:year +
  loc:year + rep:loc + rep:year + rep:loc:year, data=datb)
anova(m1)
#> Analysis of Variance Table
#> 
#> Response: yield
#>              Df Sum Sq Mean Sq  F value    Pr(>F)    
#> rep           2   28.6    14.3   0.7498 0.4765700    
#> loc           3 9324.6  3108.2 162.8452 < 2.2e-16 ***
#> year          1 5820.0  5820.0 304.9205 < 2.2e-16 ***
#> gen           4  965.7   241.4  12.6489 1.214e-07 ***
#> loc:gen      12 1293.4   107.8   5.6471 1.676e-06 ***
#> year:gen      4  513.5   128.4   6.7265 0.0001389 ***
#> loc:year      3 1427.5   475.8  24.9302 8.386e-11 ***
#> rep:loc       6 1242.8   207.1  10.8523 2.672e-08 ***
#> rep:year      2   74.0    37.0   1.9385 0.1522708    
#> loc:year:gen 12 2020.5   168.4   8.8217 1.225e-09 ***
#> rep:loc:year  6  360.7    60.1   3.1495 0.0090698 ** 
#> Residuals    64 1221.6    19.1                       
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# library(latticeExtra)
# useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=datb))
```
