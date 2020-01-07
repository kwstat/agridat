# harvey.cattle.r
# Time-stamp: <27 Mar 2017 13:30:27 c:/x/rpack/agridat/data-raw/harvey.cattle.r>

# from asreml
dat <- structure(list(Calf = structure(1:65, .Label = c("101", "102", 
"103", "104", "105", "106", "107", "108", "109", "110", "111", 
"112", "113", "114", "115", "116", "117", "118", "119", "120", 
"121", "122", "123", "124", "125", "126", "127", "128", "129", 
"130", "131", "132", "133", "134", "135", "136", "137", "138", 
"139", "140", "141", "142", "143", "144", "145", "146", "147", 
"148", "149", "150", "151", "152", "153", "154", "155", "156", 
"157", "158", "159", "160", "161", "162", "163", "164", "165"
), class = "factor"), Sire = structure(c(1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 
4L, 4L, 4L, 4L, 4L, 4L, 4L, 4L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 6L, 
6L, 6L, 6L, 6L, 6L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 8L, 8L, 8L, 
8L, 8L, 8L, 8L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L), .Label = c("Sire_1", 
"Sire_2", "Sire_3", "Sire_4", "Sire_5", "Sire_6", "Sire_7", "Sire_8", 
"Sire_9"), class = "factor"), Dam = structure(c(1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = "0", class = "factor"), 
    Line = structure(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
    1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 
    2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 
    3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 
    3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L), .Label = c("1", 
    "2", "3"), class = "factor"), ageOfDam = c(3L, 3L, 4L, 4L, 
    5L, 5L, 5L, 5L, 4L, 4L, 5L, 5L, 5L, 5L, 5L, 5L, 3L, 4L, 5L, 
    5L, 5L, 3L, 3L, 4L, 4L, 5L, 5L, 5L, 5L, 3L, 4L, 4L, 5L, 5L, 
    5L, 5L, 4L, 4L, 5L, 5L, 5L, 5L, 3L, 3L, 4L, 5L, 5L, 5L, 5L, 
    5L, 3L, 3L, 3L, 4L, 5L, 5L, 5L, 3L, 4L, 4L, 4L, 5L, 5L, 5L, 
    5L), y1 = c(192L, 154L, 185L, 183L, 186L, 177L, 177L, 163L, 
    188L, 178L, 198L, 193L, 186L, 175L, 171L, 168L, 154L, 184L, 
    174L, 170L, 169L, 158L, 158L, 169L, 144L, 159L, 152L, 149L, 
    149L, 189L, 187L, 165L, 181L, 177L, 151L, 147L, 184L, 184L, 
    187L, 184L, 183L, 177L, 205L, 193L, 162L, 206L, 205L, 187L, 
    178L, 175L, 200L, 184L, 175L, 178L, 189L, 184L, 183L, 166L, 
    187L, 186L, 184L, 180L, 177L, 175L, 164L), y2 = c(390L, 403L, 
    432L, 457L, 483L, 469L, 428L, 439L, 439L, 407L, 498L, 459L, 
    459L, 375L, 382L, 417L, 389L, 414L, 483L, 430L, 443L, 381L, 
    365L, 386L, 339L, 419L, 469L, 376L, 375L, 395L, 447L, 430L, 
    453L, 385L, 414L, 353L, 411L, 420L, 427L, 409L, 337L, 352L, 
    472L, 340L, 375L, 451L, 472L, 402L, 464L, 414L, 466L, 356L, 
    449L, 360L, 385L, 431L, 401L, 404L, 482L, 350L, 483L, 425L, 
    420L, 449L, 405L), y3 = c(224L, 265L, 241L, 225L, 258L, 267L, 
    271L, 247L, 229L, 226L, 197L, 214L, 244L, 252L, 172L, 275L, 
    238L, 246L, 229L, 230L, 294L, 250L, 244L, 244L, 215L, 254L, 
    274L, 250L, 254L, 265L, 252L, 267L, 279L, 233L, 267L, 269L, 
    300L, 249L, 225L, 249L, 202L, 231L, 257L, 237L, 264L, 237L, 
    222L, 190L, 261L, 213L, 216L, 233L, 252L, 245L, 144L, 172L, 
    217L, 268L, 243L, 236L, 244L, 266L, 246L, 252L, 242L)), .Names = c("Calf", 
"Sire", "Dam", "Line", "ageOfDam", "y1", "y2", "y3"), row.names = c(NA, 
-65L), class = "data.frame")


names(dat) <- c('calf','sire','dam','line','damage','age','weight','gain')
lib(kw)
dat$calf <- paste0("C",pad(1:65))
levels(dat$sire) <- c("S1","S2","S3","S4","S5","S6","S7","S8","S9")
dat$line <- paste0("L",dat$line)
dat$gain <- dat$gain/100
dat <- dat[,c('line','sire','damage','calf','age','weight','gain')]
names(dat)[5] <- 'weanage'
names(dat)[7] <- 'adg'

dat$damage <- paste0("A",dat$damage)
# ----------------------------------------------------------------------------

harvey.cattle = dat

dotplot(adg ~ sire|line,dat, main="harvey.cattle")
xyplot(weanage ~ weight,dat)

# Model suggested by Harvey on page 103
m0 <- lm(adg ~ 1 + line + sire + damage + line:damage + weanage + weight, data=dat)
# Due to contrast settings, it can be hard to compare model coefficients to Harvey,
# but note the slopes of the continuous covariates match Harvey p. 107, where his
# b is weanage, d is weight
# coef(m0)
#       weanage       weight 
#  -0.008154879  0.001970446

require(lme4)
m1 <- lmer(adg ~ 1 + weanage + weight + (1|line) + (1|sire) + (1|damage) + (1|line:damage), data=dat)
vc(m1)

# An attempt to reproduce table 4 of Harvey, p. 109.
require(lsmeans)
lsmeans(m0,c('line','sire','damage'))


