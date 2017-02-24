library(dplyr)

source("yield_function.R")

n <- 1000
d <- data.frame(
  x1 = runif(n),
  x2 = runif(n),
  x3 = runif(n, 120, 180)) %>%
  
  group_by(x1,x2,x3) %>%
  do(data.frame(y = yield_function(as.numeric(.))))

saveRDS(d, file="computer_experiments.rds")
