S0 <- 100
r <- 0.01
d <- 0.005
vol <- 0.1
K <- 100
Maturity <- 1
#K <- S0*exp((r-d)*Maturity)


NumTS <- 4
deltaT <- Maturity/NumTS
NumScen <- 10000

deltaDF = exp(-r*deltaT)


W <- rnorm(NumScen*(NumTS+1))*sqrt(deltaT)
dim(W) = c(NumTS+1, NumScen)

W[1,] = 0
for(i in 2:NumTS+1)
  W[i,] =W[i-1,]+W[i,] 

S <- rep(1, (NumTS+1)*NumScen)
dim(S)= c(NumTS+1, NumScen)

for(i in 0:NumTS)
  S[i+1,]=S0*exp((r-d-0.5*vol^2)*deltaT*i+vol*W[i+1,])

ITM = S > K
Ex = rep(FALSE, NumTS*NumScen)
dim(Ex) = c(NumTS, NumScen)

models = c()

par(mfrow=c(NumTS-1,1))

for(i in NumTS:2)
{
  #regression only on ITM scenarios
  IX = which(ITM[i,] %in% c(TRUE))
  #IX = 1:NumScen
  X = pmax(S[i, IX]-K,0)
  Y = pmax((S[i+1, IX]-K),0)*deltaDF
  model <- lm(Y~X+I(X^2))
  models = c(models, list(model))
  ExFlag =  X > predict(model)
  ExIX =  which(ExFlag %in% c(TRUE))
  Ex[i,IX[ExIX]] = TRUE 
  
  plot(X,Y)
  #abline(lm(Y~X), col = "blue")
  x = seq(min(X), max(X), by = 0.1)
  lines(x, predict(model, list(X=x)), col = "red")
}





#rm(list=ls())
