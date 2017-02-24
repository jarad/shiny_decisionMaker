

pageWithSidebar(
  headerPanel('Decision Maker'),
  sidebarPanel(
    sliderInput('price', 'Corn price ($/bushel)\nLinear and therefore quick updating', 0, 10, 3.78),
    sliderInput('n_rate', 'Nitrogen rate (lbs/acre)\nNonlinear and therefore slower', 120, 180, 150)
  ),
  mainPanel(
    plotOutput('plot')
  )
)

