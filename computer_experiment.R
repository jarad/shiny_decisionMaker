library(dplyr)

source("park_function.R")

n <- 1000
d <- data.frame(
  x1 = runif(n),
  x2 = runif(n),
  x3 = runif(n),
  x4 = runif(n)) %>%
  
  group_by(x1,x2,x3,x4) %>%
  do(data.frame(y = park_function(as.numeric(.))))

saveRDS(d, file="computer_experiments.rds")
