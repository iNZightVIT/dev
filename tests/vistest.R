library(grid)
library(iNZightPlots)
data("census.at.school.500", package = "iNZight")
cas <- census.at.school.500


## pt <- proc.time()
## pl <- iNZightPlot(armspan, height, data = cas,
##                   g1 = factor(rep(1, nrow(cas)), levels = 1:20),
##                   main = "Series of Null Plots + Data Plot",
##                   layout.only = TRUE)
## ord <- sample(20)
## for (i in 1:20) {
##     seekViewport(paste0("VP:locate.these.points1", ord[i]))
##     grid.rect(gp = gpar(fill = pl$gen$opts$bg, lty = 0))
##     obj <- pl$all$`1`
##     if (i > 1) {
##         obj$y <- sample(obj$y)
##     }
##     plot(obj, gen = c(pl$gen, list(LIM = c(pl$xlim, pl$ylim))))
##     grid.rect()
## }
## proc.time() - pt

iNZightPlot(armspan, height, data = cas)


pt <- proc.time()
pl <- iNZightPlot(armspan, height, data = cas,
                  g1 = factor(rep(1, nrow(cas)), levels = 1:20),
                  main = "Series of Null Plots + Data Plot",
                  layout.only = TRUE)
ord <- sample(20)
for (i in 1:20) {
    seekViewport(paste0("VP:locate.these.points1", ord[i]))
    grid.rect(gp = gpar(fill = pl$gen$opts$bg, lty = 0))
    if (i > 1) {
        pl2 <- iNZightPlot(armspan, sample(height), data = cas, plot = FALSE)
        plot(pl2$all$all, c(pl2$gen, list(LIM = c(pl2$xlim, pl2$ylim))))
    } else {
        plot(pl$all$`1`, gen = c(pl$gen, list(LIM = c(pl$xlim, pl$ylim))))
    }
    grid.rect()
}
proc.time() - pt


pl <- iNZightPlot(height, travel, data = cas,
                  g1 = factor(rep(1, nrow(cas)), levels = 1:20),
                  main = "Series of Null Plots + Data Plot",
                  layout.only = TRUE)
ord <- sample(20)
dev.hold()
for (i in 1:20) {
    seekViewport(paste0("VP:locate.these.points1", ord[i]))
    grid.rect(gp = gpar(fill = pl$gen$opts$bg, lty = 1))
    if (i > 1) {
        pl2 <- iNZightPlot(height, sample(travel), data = cas, plot = FALSE)
        plot(pl2$all$all, c(pl2$gen, list(LIM = c(pl2$xlim, pl2$ylim))))
    } else {
        plot(pl$all$`1`, c(pl$gen, list(LIM = c(pl$xlim, pl$ylim))))
    }
    if (class(pl$all$`1`) %in% c("inzdot")) {
        seekViewport("VP:dotplot-levels")
        popViewport()
    }
}
dev.flush()

## show the data plot
seekViewport(paste0("VP:locate.these.points1", ord[1]))
grid.rect(gp = gpar(col = "red", lwd = 2, fill = "transparent"))





pl <- iNZightPlot(travel, gender, data = cas,
                  g1 = factor(rep(1, nrow(cas)), levels = 1:20),
                  main = "Series of Null Plots + Data Plot",
                  layout.only = TRUE)
ord <- sample(20)
dev.hold()
for (i in 1:20) {
    seekViewport(paste0("VP:locate.these.points1", ord[i]))
    grid.rect(gp = gpar(fill = pl$gen$opts$bg, lty = 1))
    if (i > 1) {
        pl2 <- iNZightPlot(sample(travel), gender, data = cas, plot = FALSE)
        pl2$gen$col.args <- pl$gen$col.args
        plot(pl2$all$all, c(pl2$gen, list(LIM = c(pl2$xlim, pl2$ylim))))
    } else {
        plot(pl$all$`1`, c(pl$gen, list(LIM = c(pl$xlim, pl$ylim))))
    }
    if (class(pl$all$`1`) %in% c("inzdot")) {
        seekViewport("VP:dotplot-levels")
        popViewport()
    }
}
dev.flush()

## show the data plot
seekViewport(paste0("VP:locate.these.points1", ord[1]))
grid.rect(gp = gpar(col = "red", lwd = 2, fill = "transparent"))



