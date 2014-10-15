L <- 10000
N <- 10000

a <- rnorm(L)
b <- rnorm(N)

X <- rep(1, L*N)
dim(X)=c(N,L)



for(i in 1:N)
  X[i,] = a + b[i]


qqnorm(X); qqline(X, col = 2)
qqplot(X, rt(300, df = 5))