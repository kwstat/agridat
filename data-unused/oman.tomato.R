# oman.tomato.R

# The data in Oman's paper is a table of means.
# I can't match most of the parameter estimates found in
# the results sections of the Oman paper and Gogel paper.
# I suspect the analysis in Oman's paper used plant-level data.

Source
S.D. Oman (1988).
Multiplicative Effects in Mixed Model Analysis of Variance.
Stanford School of Humanities and Statistics, Report Number: OLK NSF 247.

Samuel D. Oman (1991). 
Multiplicative Effects in Mixed Model Analysis of Variance.
Biometrika, 78 (4), 729-739.
http://doi.org/10.2307/2336924

Reference
Beverley J. Gogel, Brian R. Cullis and Arunus P. Verbyla (1995).
REML Estimation of Multiplicative Effects in Multienvironment Variety Trails.
Biometrics, 51 (2), 744-749.
http://doi.org/10.2307/2532960


dat <- data.frame( yield = c(
11.609, 14.005, 15.987,
10.120, 15.615, 18.955,
10.120, 16.839, 19.508,
11.238, 16.940, 17.790,
10.834, 12.963, 17.198,
12.442, 15.663, 23.988,
11.637, 17.210, 18.262,
10.292, 14.777, 18.295,
10.140, 12.453, 17.824,
11.583, 19.256, 21.967,
11.077, 15.380, 19.479,
10.810, 17.277, 18.986,
10.939, 15.083, 19.205,
12.415, 17.117, 22.124,
10.816, 16.620, 19.230,
 9.549, 14.198, 16.804,
13.028, 18.432, 23.012,
 9.989, 14.755, 16.246,
12.194, 17.304, 20.745,
10.874, 15.307, 16.305,
11.705, 14.661, 21.055),
gen=rep(c("G1","G2","G3"), 21),
fam=rep(paste0("F",kw::pad(1:21)), each=3))
dat <- dplyr::mutate(dat, gen=factor(gen), fam=factor(fam))

library(mumm)

# y ~ 1 + fix + (1|ran) + (1|ran:fix) + mp(ran,fix)
m1 <- mumm(yield ~ -1 + gen + (1|fam) + (1:fam:gen) + mp(fam,gen), dat)
# gen eff
m1$par_fix + c(0, rep(m1$par_fix[1],2)) # Match table 4 genotype estimates
ranef(m1)
m1$par
m1$par_fix
m1$sigmas^2 # Oman has sig^2_b = 1.487, sig^2_c = 0.237
m1$sdreport
