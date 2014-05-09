library(grid)
upd <- function() {
    try(system("rm ~/iNZight/iNZightPlots/R/*~"))
    invisible(lapply(list.files("~/iNZight/iNZightPlots/R", full.names = TRUE), source))
}
d <- read.csv("~/iNZight/data/Census at School-500.csv")
H <- d$height; A <- d$armspan
count <- rpois(500, 10)

upd();
fs <- inzStructure("freq", count)
iNZightPlot(height, armspan, sizeby = age, data = d)

upd()
head(iNZightPlot(H, log(A), varnames = list(x = "height (cm)", freq = "count"), structure = fs)) -> p

upd()
d$height[10] <- Inf
iNZightPlot(height, armspan, colby = gender, data = d)
iNZightPlot(height, armspan, g2 = gender, g2.level = "male", data = d)

upd()
iNZightPlot(height, armspan, g2 = cellsource, g2.level = 2, data = d)

upd()
ff <- as.factor(sample(1:200, 500, TRUE))
iNZightPlot(ff)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g1.level = 1:2, data = d)
iNZightPlot(height, data = d, structure = fs)
iNZightPlot(gender, data = d)

upd()
ipar <- inzpar(jitter = "x")
iNZightPlot(height, armspan, data = d, inzpar = ipar)
iNZightPlot(height, armspan, data = d, jitter = "y")
iNZightPlot(height, armspan, data = d)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g2 = travel, g2.level = "_MULTI", data = d)
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, data = d)

upd()
iNZightPlot(height, armspan, data = d, structure = fs)


upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, structure = fs, data = d)

upd()
iNZightPlot(height, armspan, data = d, cex.axis = 0.7)
iNZightPlot(height, armspan, g1 = gender, g2 = cellsource, g2.level = "_MULTI", data = d)
iNZightPlot(height, armspan, g1 = gender, g2 = cellsource, g2.level = "other", data = d)
iNZightPlot(height, armspan, g1 = getlunch, g1.level = "none", data = d)
iNZightPlot(height, g1 = getlunch, data = d)
