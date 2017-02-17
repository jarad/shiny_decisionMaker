

pageWithSidebar(
  headerPanel('Decision Maker'),
  sidebarPanel(
    sliderInput('x1', 'X1 Variable', 0, 1, 0.5),
    sliderInput('x2', 'X2 Variable', 0, 1, 0.5)
  ),
  mainPanel(
    plotOutput('plot')
  )
)

