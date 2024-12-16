ECant find this paper. Tried:
"larsen"  "methoden des feldversuches"  google books scholar archive hathi
"larsen" "Om metoder för fältförsök" google books scholar archive hathi

Larsen, B. R. (1898).
Om metoder för fältförsök. In Ber. Andra nordiska Landsbrukskongressen in Stockholm 1897. P. 72-84. Discussion 85-94.

  Holtsmark, G and Larsen, B R (1905).
  Om Muligheder for at indskraenke de Fejl, som ved Markforsog betinges af Jordens Uensartethed.
  Tidsskrift for Landbrugets Planteavl. 12, 330-351. (In Danish)
  Data on page 347.
  https://books.google.com/books?id=MdM0AQAAMAAJ&pg=PA330
  https://dca.au.dk/publikationer/historiske/planteavl/

    Holtsmark, G. and Bastian R. Larsen (1907)
  Uber die Fehler, welche bei Feldversuchen, durch die Ungleichartigkeit des Bodens bedingt werden.
  Die Landwirtschaftlichen Versuchs-Stationen, 65, 1--22. (In German)
  https://books.google.com/books?id=eXA2AQAAMAAJ&pg=PA1

Ehrenberg, P. (1920).
Versuch eines Beweises für die Anwendbarkeit der Wahrscheinlichkeitsrechnung bei Feldversuchen.
Die Landwirtschaflichen versuchs-stationen, 95, 157-294
https://archive.org/details/dielandwirtschaf9519reun/page/156/
          https://www.google.com/books/edition/Die_Landwirtschaftlichen_Versuchs_Statio/h9FGAAAAYAAJ

Data were typed from Ehrenberg 1920, p 254-276.
The layout is not given.  All of the other datasets where Ehrenberg gives the plots values are laid out in rows & columns (I compared the actual values in Ehrenberg with the values in agridat datasets), so it would make sense that the Larsen experiment

Russell (29)


libs(readxl)
dat0 <- read_excel("data-raw/larsen.timothy.uniformity.xlsx", col_names=FALSE) / 10


    I tried various ways of partitioning 960 plots into rows and columns.
Some are clearly wrong.
Some could perhaps be right.

libs(dplyr,desplot)

dat <- cbind(dat0, expand.grid(1:60, 1:(16)))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=60/16, main="16 x 60")

dat <- cbind(dat0, expand.grid(1:48, 1:20))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=48/28, main="20 x 48")

dat <- cbind(dat0, expand.grid(1:40, 1:(24)))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=40/24, main="24 x 40")

dat <- cbind(dat0, expand.grid(1:32, 1:30))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=32/30, main="30 x 32") # maybe

dat <- cbind(dat0, expand.grid(1:30, 1:32))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=30/32, main="32 x 30") # maybe

dat <- cbind(dat0, expand.grid(1:24, 1:40))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=24/40, main="40 x 24") # maybe

dat <- cbind(dat0, expand.grid(1:20, 1:(48)))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=20/48, main="48 x 20")

dat <- cbind(dat0, expand.grid(1:(16), 1:60))  %>%  setNames(c("yield","row","col"))
desplot(dat, yield~col*row, tick=TRUE, flip=TRUE, aspect=16/60, main="60 x 16")


# I tried to fit a cyclical series to the data to find the period, but this
# didn't work.
# https://online.stat.psu.edu/stat510/lesson/6/6.1
xx <- dat$yield
nn <- length(xx)
FF = abs(fft(xx)/sqrt(nn))^2
P = (4/nn)*FF[1:(nn/2 +1)] # Only need the first (n/2)+1 values of the FFT result.
f = (0:(nn/2))/nn # this creates harmonic frequencies from 0 to .5 in steps of 1/128.
plot(f, P, type="l") # This plots the periodogram; type = “l” creates a line plot. Note: l is lowercase L, not number 1.


# Time series plot
plot(dat$yield, cex=.75, ylab="yield")
kk = identify(dat$yield)
mean(diff(kk)) # 79.75

# This looks right!
dat <- cbind(dat0, expand.grid(1:80,1:12))  %>%  setNames(c("yield","row","col"))
#larsen.timothy.uniformity <- dat
#kw::agex(larsen.timothy.uniformity)

desplot(dat, yield~col*row,
        tick=TRUE, flip=TRUE, aspect=80/12,
        main="larsen.timothy.uniformity")


