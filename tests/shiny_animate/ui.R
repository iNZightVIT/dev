library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Animation example!"),

    sidebarPanel(

    ),
    mainPanel(
        plotOutput("distPlot")
    )
))
