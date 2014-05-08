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
pp <- iNZightPlot(height, armspan, sizeby = age, data = d)

upd()
head(iNZightPlot(H, log(A), varnames = list(x = "height (cm)", freq = "count"), structure = fs)) -> p

upd()
d$height[10] <- Inf
p <- iNZightPlot(height, armspan, colby = gender, data = d)
p <- iNZightPlot(height, armspan, g2 = gender, g2.level = "male", data = d)

upd()
iNZightPlot(height, armspan, g2 = cellsource, g2.level = 2, data = d)$missing

upd()
ff <- as.factor(sample(1:200, 500, TRUE))
iNZightPlot(ff)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g1.level = 1:2, data = d)$missing
iNZightPlot(height, data = d, structure = fs)
iNZightPlot(gender, data = d)

upd()
ipar <- inzpar(jitter = "x")
iNZightPlot(height, armspan, data = d, inzpar = ipar)$toplot
iNZightPlot(height, armspan, data = d, jitter = "y")$inzpar$jitter
iNZightPlot(height, armspan, data = d)$inzpar$jitter

upd()
iNZightPlot(height, armspan, data = d)$toplot
iNZightPlot(height, armspan, g1 = gender, data = d)$toplot

upd()
iNZightPlot(height, armspan, data = d, structure = fs)$toplot$all -> eh


with(eh, plot(x, y, cex = propsize))

upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, structure = fs, data = d)
