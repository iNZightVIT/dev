library(grid); library(survey); library(quantreg)
upd <- function() {
    dd <- "~/iNZight/iNZightPlots/R"
    if (length(list.files(paste0(dd, "/*~"))) > 0)
        system(paste0("rm", dd, "/*~"))
    invisible(lapply(list.files(dd, full.names = TRUE), source))
}
upd()
d <- read.csv("~/iNZight/data/Census at School-500.csv")
H <- d$height; A <- d$armspan
count <- rpois(500, 10)

upd();
iNZightPlot(height, armspan, sizeby = age, data = d, colby = gender, col.pt = c("red", "blue"))

upd()
iNZightPlot(H, log(A), varnames = list(x = "height (cm)"), freq = count)

upd()
d$height[10] <- Inf
iNZightPlot(height, armspan, colby = gender, data = d)
iNZightPlot(height, armspan, g2 = gender, g2.level = "male", data = d)

upd()
iNZightPlot(height, armspan, g2 = cellsource, g2.level = 5, data = d)


## Slight complication when g2 = SOMETHING without g1 --- need to completely forget about g2 ...

upd(); ff <- as.factor(sample(1:200, 500, TRUE)); iNZightPlot(ff)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g1.level = 1:2, data = d)
iNZightPlot(height, data = d, structure = fs)
iNZightPlot(gender, data = d)

upd()
ipar <- inzpar(jitter = "y")
iNZightPlot(height, age, data = d, inzpar = ipar)
iNZightPlot(height, age, data = d, jitter = "y")
iNZightPlot(height, age, data = d)

upd()
iNZightPlot(height, armspan, g1 = cellsource, g2 = travel, g2.level = "_MULTI", data = d)
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, data = d)

upd()
iNZightPlot(height, armspan, data = d, structure = fs)$toplot$all -> eh

upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, structure = fs, data = d, alpha = 0.5, colby = getlunch)

upd()
iNZightPlot(y=height, x=armspan, data=d, g1=gender, g2=getlunch, g2.level="_MULTI",
            cex.axis = 1.2)




iNZightPlot(height, armspan, data = d, structure = fs)


upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, g1 = gender, structure = fs, data = d)

upd()
iNZightPlot(height, armspan, data = d, cex.axis = 0.7)
iNZightPlot(height, armspan, g1 = gender, g2 = cellsource, g2.level = "_MULTI", data = d)
iNZightPlot(height, armspan, g1 = gender, g2 = cellsource, g2.level = "other", data = d)
iNZightPlot(height, armspan, g1 = getlunch, g1.level = "none", data = d)
#iNZightPlot(height, g1 = getlunch, data = d)


upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, sizeby = age, g1 = gender, data = d)
iNZightPlot(height, armspan, g1 = age, sizeby = age, data = d)

upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE)
iNZightPlot(height, armspan, data = d, smooth = 0.5)
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"))
iNZightPlot(height, armspan, data = d, trend = "linear", colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE)


upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"),
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = "linear", colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")


upd()
iNZightPlot(height, armspan, data = d, quant.smooth = "default")


upd()
iNZightPlot(height, armspan, data = d, colby = gender, g1 = getlunch,
            g2 = gender, g2.level = "_MULTI", col.pt = c("pink", "blue"),
            quant.smooth = "default", LOE = TRUE)

upd()
iNZightPlot(height, armspan, data = d, colby = rightfoot)
iNZightPlot(height, cellcost, data = d, colby = cellcost)


upd()
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, colby = gender, data = d)
iNZightPlot(height, armspan, colby = cellsource, data = d)
iNZightPlot(height, armspan, colby = cellcost, data = d)

upd()
iNZightPlot(height, armspan, data = d, sizeby = cellcost, colby = gender)
iNZightPlot(height, armspan, data = d, sizeby = cellcost, colby = rightfoot)

upd()
iNZightPlot(height, armspan, data = d, colby = gender, trend = "linear", trend.by = TRUE,
            bs.inference = TRUE)


X <- rep(seq(1:10), 2)
Y <- runif(length(X), 0, 10)
G <- factor(rep(c("male", "female"), each = length(X) / 2))

upd()
iNZightPlot(X, Y, join = TRUE)
iNZightPlot(X, Y, colby = G, join = TRUE)


d2 <- read.csv("~/iNZight/data/Gap Minder Data.csv", header = TRUE)
d3 <- subset(d2, !is.na(d2$Population))

upd(); st <- inzStructure("freq", Population, d3)
iNZightPlot(log(GDP.per.Capita), Life.Expectancy, data = d3, colby = Region, alpha = 0.4,
            structure = st)

# a pseudo-size thingy :
wt <- rpois(nrow(d2), d2$GDP.per.Capita) + 1
wt[is.na(wt)] <- rpois(sum(is.na(wt)), 1) + 1

upd()
iNZightPlot(log(GDP.per.Capita), Life.Expectancy, data = d2, colby = Region,
            largesample = FALSE, sizeby = wt)
iNZightPlot(log(GDP.per.Capita), Life.Expectancy, data = d2,
            largesample = FALSE, sizeby = wt)
iNZightPlot(log(GDP.per.Capita), Life.Expectancy, data = d2, alpha = 0.5, cex.pt = 1,
            structure = inzStructure("freq", wt), largesample = FALSE)
iNZightPlot(log(GDP.per.Capita), Life.Expectancy, data = d2, alpha = 0.5, cex.pt = 3,
            structure = inzStructure("freq", wt)) -> o

upd()
iNZightPlot(armspan, height, g1 = getlunch, g2 = travel, g2.level = "_MULTI", data = d,
            LOE = TRUE, trend = "linear")

#pdf("~/Desktop/plot.pdf", width = 10, height = 8)
#dev.off()

ds <- read.csv("~/iNZight/data/nhanes-03-04.chris.csv", header = TRUE)
summary(ds)

upd()
iNZightPlot(BPXPLS, BPXSY1, data = ds, g1 = agegp, g2 = RIDRETH1, g2.level = 1,
            structure = inzStructure("freq", WTINT2YR, ds, force = TRUE))


upd()
inzStructure(list(freq = WTINT2YR), data = ds, force.to.int = TRUE)

upd()
inzStructure(list(ids = ~1), data = ds, force.to.int = TRUE) ->a

data(api)
                                        # stratified sample
dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
                                        # one-stage cluster sample
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
                                        # two-stage cluster sample: weights computed from population sizes.
dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)



## moving on from scatter plots?
print(iNZightPlot(armspan, height, data = d)$toplot)



d2 <- data.frame(x = round(rnorm(10, 10, 2), 1),
                 y = round(rnorm(10, 50, 3), 1),
                 freq = rpois(10, 20),
                 gender = rep(c("male", "female"), each = 5),
                 cluster = sample(1:3, 10, TRUE),
                 wt = rpois(10, 50))
iNZightPlot(x, y, data = d2, sizeby = freq, alpha = 0.5) -> pp

des <- svydesign(ids=~cluster, weights =~wt, data = d2)

svyplot(meals ~ acs.core, design = dclus2, style = "hex")

upd()
iNZightPlot(x, y, data = d2, sizeby = freq)
iNZightPlot(x, y, data = d2, freq = freq, sizeby = freq)
iNZightPlot(x, y, design = des)



upd()
iNZightPlot(x, y, data = d2, sizeby = freq, g1 = gender)
iNZightPlot(x, y, data = d2, freq = freq, g1 = gender)
upd(); iNZightPlot(x, y, design = des, g1 = gender)
upd(); iNZightPlot(x, y, design = des, g1 = cluster)

iNZightPlot(x, data = d2, g1 = gender)
iNZightPlot(x, data = d2, freq = freq, g1 = gender)
iNZightPlot(x, design = des, g1 = gender)

upd()
iNZightPlot(y = height, x = armspan, data = d, g1 = gender,
            g2 = getlunch, g2.level = "_MULTI")



upd()
iNZightPlot(x, y, data = d2)
iNZightPlot(x, y, data = d2, freq = freq)
upd(); iNZightPlot(x, y, design = des)






d3 <- read.csv("~/iNZight/data/Gap Minder Data.csv")
plot(hexbin(log10(d3$GDP.per.Capita), d3$Life.Expectancy), style = "lattice")





with(d, plot(armspan, height, pch = 19, cex = 2, col = rgb(0, 0, 0, count / max(count))))
with(d, plot(armspan, height, pch = 1, cex = rescale(count)))
with(d, svyplot(height ~ armspan, svydesign(ids=~1, weights=~count, data=d), style = "hex"))
with(d, svyplot(height ~ armspan, svydesign(ids=~1, weights=~count, data=d), style = "grayhex"))
