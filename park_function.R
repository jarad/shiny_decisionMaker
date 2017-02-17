park_function <- function(x) {
  x[2]/2*(sqrt(1+(x[2]+x[3]^2)*x[4]/x[1]^2)-1)+(x[1]+3*x[4])*exp(1+sin(x[3]))
}
