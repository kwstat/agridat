# clewer.wheat.R
# Time-stamp: <2024-12-05>

# Clewer, Alan G. and Scarisbrick, David H. (2001).
# Practical Statistics and Experimental Design for Plant and Crop Science.
# Wiley, New York.
# Example 10.1, Table 10.1, page 135.

# Data extracted from Table 10.1 (field layout with plot yields in t/ha)
# Experiment: RCBD with 4 wheat varieties (V1=standard, V2-V4=new) in 3 blocks
# Blocks positioned at right angles to suspected fertility gradient

# Field layout from Table 10.1:
# Block 1: V2(9.8)  V4(9.5)  V3(7.3)  V1(7.4)
# Block 2: V3(6.1)  V2(6.8)  V1(6.5)  V4(8.0)
# Block 3: V3(6.4)  V2(6.2)  V4(7.4)  V1(5.6)

dat <- data.frame(
  row = c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3),
  col = c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4),
  block = c("B1", "B1", "B1", "B1", "B2", "B2", "B2", "B2", "B3", "B3", "B3", "B3"),
  gen = c("V2", "V4", "V3", "V1", "V3", "V2", "V1", "V4", "V3", "V2", "V4", "V1"),
  yield = c(9.8, 9.5, 7.3, 7.4, 6.1, 6.8, 6.5, 8.0, 6.4, 6.2, 7.4, 5.6)
)

# Verify variety means match book (Table 10.2)
aggregate(yield ~ gen, data = dat, FUN = mean)
#   gen yield
# 1  V1  6.50
# 2  V2  7.60
# 3  V3  6.60
# 4  V4  8.30

# Grand mean
mean(dat$yield)  # 7.25

# Block means
aggregate(yield ~ block, data = dat, FUN = mean)
#   block yield
# 1    B1  8.50
# 2    B2  6.85
# 3    B3  6.40

# ANOVA - verify against Output 10.1 in book
m1 <- aov(yield ~ block + gen, data = dat)
anova(m1)
# Should match:
# Block:    DF=2, SS=9.78,  MS=4.89, F=12.22, p=0.008
# Variety:  DF=3, SS=6.63,  MS=2.21, F=5.52,  p=0.037
# Error:    DF=6, SS=2.40,  MS=0.40
# Total:    DF=11, SS=18.81
