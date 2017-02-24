library(laGP)
library(ggplot2)

computer_experiments <- readRDS("computer_experiments.rds")

grid <- expand.grid(x1 = seq(0,1,length=101),
                    x2 = seq(0,1,length=101))

gp <- newGP(as.matrix(computer_experiments[,c("x1","x2","x3")]),
            as.vector(as.matrix(computer_experiments[,"y"])),
            d = 2, g = 1e-6, dK = TRUE)

mle <- mleGP(gp, tmax=200)

function(input, output, session) {
  
  updatedData <- reactive({
    grid$x3 <- input$n_rate
    return(grid[c("x1","x2","x3")])
  })
  
  updatePredictions <- reactive({
    d <- updatedData()
    p <- predGP(gp, as.matrix(d))
    d$mean <- p$mean
    d$sd <- sqrt(diag(p$Sigma))
    return(d)
  })
  
  withPrice <- reactive({
    d <- updatePredictions()
    d$`Profit ($/acre)` <- d$mean*input$price - 4.58*200
    return(d)
  })
  
  output$plot <- renderPlot({
    d <- withPrice()
    
    ggplot(d, aes(x1, x2, fill=`Profit ($/acre)`)) +
      geom_tile() + 
      scale_fill_gradient2() + 
      theme_bw()
  })
  
}

