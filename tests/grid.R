library(iNZightPlots)
##library(cairoDevice)
devtools::install_github("lawremi/cairoDevice")
library(cairoDevice)
library(gWidgets2RGtk2)
library(grid)


dev.gwidgets2 <- function() {
    w <- gwindow(width = 600, height = 600,
                 visible = FALSE)
    noteb <- gstackwidget(expand = TRUE)
    add(w, noteb, expand = TRUE)
    fig <- ggraphics(expand = TRUE)
    add(noteb, fig)
    visible(w) <- TRUE
}


#iNZightPlot(rnorm(100), rnorm(100), colby = runif(100, 10, 30))



### A TEST
test <- function(n=200) {
    xx <- rep(c(0, 1, 1, 0), n)
    yy <- rep(0:n / n, each = 4)[1:(4 * n) + 2]
    id <- rep(1:n, each = 4)
    poly <- polygonGrob(xx, yy, id = id, gp = gpar(lty = 0, fill = (n.cols <- rainbow(n, start = 1/6))))
    grid.newpage()
    pushViewport(viewport(0.5, 0.5, 0.5, 0.5))
    grid.draw(poly)
}


dev.gwidgets2()
test(5)

grid.rect()

dev.new()
test(10)

Cairo()
test(10)

q()

## test
library(cairoDevice)
library(grid)

test <- function(n=200) {
    xx <- rep(c(0, 1, 1, 0), n)
    yy <- rep(0:n / n, each = 4)[1:(4 * n) + 2]
    id <- rep(1:n, each = 4)
    poly <- polygonGrob(xx, yy, id = id, gp = gpar(lty = 0, fill = (n.cols <- rainbow(n, start = 1/6))))
    grid.newpage()
    pushViewport(viewport(0.5, 0.5, 0.5, 0.5))
    grid.draw(poly)
}


dev.new()
test(1000)

Cairo()
test(1000)
