library(laGP)
library(ggplot2)

computer_experiments <- readRDS("computer_experiments.rds")

grid <- expand.grid(x3 = seq(0,1,length=101),
                    x4 = seq(0,1,length=101))

gp <- newGP(as.matrix(computer_experiments[,c("x1","x2","x3","x4")]),
            as.vector(as.matrix(computer_experiments[,"y"])),
            d = 2, g = 1e-6, dK = TRUE)

mle <- mleGP(gp, tmax=200)

function(input, output, session) {
  
  updatedData <- reactive({
    grid$x1 <- input$x1
    grid$x2 <- input$x2
    return(grid[c("x1","x2","x3","x4")])
  })
  
  updatePredictions <- reactive({
    d <- updatedData()
    p <- predGP(gp, as.matrix(d))
    d$mean <- p$mean
    d$sd <- sqrt(diag(p$Sigma))
    return(d)
  })
  
  output$plot <- renderPlot({
    d <- updatePredictions()
    
    ggplot(d, aes(x3, x4, fill=mean)) +
      geom_tile() + 
      scale_fill_gradient(low="red", high="green") + 
      theme_bw()
  })
  
}

