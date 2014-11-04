library(shiny)

shinyServer(function(input, output) {
    output$distPlot <- renderImage({
        unlink("hist.gif")
        system("rm hists*.jpg")

        jpeg("hists%02d.jpg")
        for (i in 1:6)
            hist(rnorm(10^i), main = paste("N =", 10^i))
        dev.off()
        
        system("convert -delay 100 hists*.jpg hist.gif")
        
        list(src = "hist.gif")
    })
})
