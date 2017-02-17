library(laGP)

d <- readRDS("computer_experiments.rds")

gp <- newGP(as.matrix(d[,c("x1","x2","x3","x4")]),
            as.vector(as.matrix(d[,"y"])),
            d = 2, g = 1e-6, dK = TRUE)

mle <- mleGP(gp, tmax=200)
