#library(devtools)
#pkg <- "~/iNZight/iNZightPlots"
#load_all(pkg)
library(iNZightPlots)
d <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#")



dev.new()
iNZightPlot(height, getlunch, data = d)


jpeg("testplot.jpg")
iNZightPlot(height, getlunch, data = d)
dev.off()

pdf("testplot.pdf")
iNZightPlot(height, getlunch, data = d)
dev.off()

png("testplot.png")
iNZightPlot(height, getlunch, data = d)
dev.off()
