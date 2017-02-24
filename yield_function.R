library(dplyr)

yield_function <- function(x) {
  x_coord <- x[1]
  y_coord <- x[2]
  n_rate  <- x[3]
  
  return(50*(sin(6*(x_coord+(1-y_coord)^2))+1) + 
    n_rate * (sin(6*(x_coord+y_coord^2))+1))
}
