# heath.cabbage.uniformity.R

yld <- c(378,419,441,458,453,404,392,407,356,369,394,417,459,399,418,558,511,499,490,544,517,518,447,508,476,457,453,504,470,470,462,517,521,502,508,557,522,470,525,617,477,452,517,566,611,581,564,595)

dat <- data.frame(yield=yld,
                  col=rep(1:6,each=8),
                  row=rep(8:1,6)
                  )
dat
heath.cabbage.uniformity <- dat

## ---------------------------------------------------------------------------

# Acre = 43560 sq ft
# .011 acres is circa 480 sq feet
# If Fig 3 is accurate, circa 40*12 feet

# Heath Fig 3-1, p. 50
libs(desplot)
desplot(dat, yield ~ col*row,
        aspect=(8*12)/(6*40),
        main="heath.cabbage.uniformity")
