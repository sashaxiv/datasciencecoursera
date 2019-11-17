add2 <- function(x,y) {
  x+y
}

above10 <- function(x){
  use<- x>10
  x[use]
}

columnMean <- function (y) {
  
  nc<-ncol(y)
  means <- c(nc)
  for(i in 1:nc){
    means[i] <- mean (y[,i])
  }
  
  means
}

## un argumento con el "=", indica un comportamiento por defecto.
columnMean <- function (y, deleteNA = TRUE) {
  
  nc<-ncol(y)
  means <- c(nc)
  for(i in 1:nc){
    means[i] <- mean (y[,i],na.rm=deleteNA)
  }
  
  means
}


## evaluacion vaga (puedes definir funciones y no utilizar variables, R hasta que no la necesita no
## la evalua. Además permite variables libres, primero las busca en la propipa función y luego sube de nivel)
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}

f(3)
34 