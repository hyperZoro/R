S0 <- 100
r <- 0.01
d <- 0.005
vol <- 0.1
K <- 100
Maturity <- 1
#K <- S0*exp((r-d)*Maturity)


numSInterval <- 50
numTInterval <- 50

minS <- 0.0
maxS <- max(S0, K) * 2

lineS = seq(minS, maxS, length.out = numSInterval+1)


#rm(list=ls())