# gauch.soy.R

libs(agridat)

dat <- gauch.soy
dat <- mutate(dat,
              year=substring(dat$env, 2),
              loc=substring(dat$env, 1, 1) )
  are C=Chazy, N=Canton, L=Lockport, G=Geneseo, R=Romulus, A=Aurora,
  I=Ithica, V=Valatie, D=Riverhead.

dat <-
  mutate(dat,
              loc=recode(loc,
                         A="Aurora", C="Chazy", E="Etna",N="Canton", L="Lockport",G="Geneseo",R="Romulus",I="Itica",V="Valatie",D="Riverhead"))
gauch.soy <- dat
write.table(gauch.soy, file = "c:/x/rpack/agridat/data/gauch.soy.txt",
            sep = "\t", row.names = FALSE)
