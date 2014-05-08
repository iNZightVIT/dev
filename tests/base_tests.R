## Testing stuff for iNZightPlots, Summaries and Inference

d <- read.csv('~/iNZight/data/Census at School-500.csv')
d2 <- read.csv('~/iNZight/data/Gap Minder Data.csv')
library(iNZightPlots)

pl <- function(...) {}#iNZightPlot(...)
gs <- function(...) {}#getPlotSummary(...)
gi <- function(...) getPlotInference(...)

upd <- function() {
    invisible(lapply(list.files('~/iNZight/iNZightPlots/R', full.names = TRUE),
                     function(x) source(x)))
    library(grid)
    library(s20x)
    library(boot)
}

# ----------------------------------------------------------------------------- #
# X: Numeric
# Y: NULL

upd()

pl(x = d$height)
gs(x = d$height)
gi(x = d$height)
gi(x = d$height, bs.inference = TRUE)

pl(x = d$height, g1 = d$travel)
gs(x = d$height, g1 = d$travel)
gi(x = d$height, g1 = d$travel)
gi(x = d$height, g1 = d$travel, bs.inference = TRUE)

pl(x = d$height, g1 = d$travel, g1.level = "walk")
gs(x = d$height, g1 = d$travel, g1.level = "walk")
gi(x = d$height, g1 = d$travel, g1.level = "walk")
gi(x = d$height, g1 = d$travel, bs.inference = TRUE, g1.level = "walk")

pl(x = d$height, g1 = d$travel, g2 = d$gender, g2.level = "male")
gs(x = d$height, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$height, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$height, g1 = d$travel, bs.inference = TRUE, g2 = d$gender, g2.level = "male")


# ----------------------------------------------------------------------------- #
# X: Numeric   or   X: Factor
# Y: Factor         Y: Numeric

upd()

pl(x = d$height, y = d$getlunch)
gs(x = d$height, y = d$getlunch)
gi(x = d$height, y = d$getlunch)
gi(x = d$height, y = d$getlunch, bs.inference = TRUE)

pl(x = d$height, y = d$getlunch, g1 = d$travel)
gs(x = d$height, y = d$getlunch, g1 = d$travel)
gi(x = d$height, y = d$getlunch, g1 = d$travel)
gi(x = d$height, y = d$getlunch, g1 = d$travel, bs.inference = TRUE)

pl(x = d$height, y = d$getlunch, g1 = d$travel, g1.level = "walk")
gs(x = d$height, y = d$getlunch, g1 = d$travel, g1.level = "walk")
gi(x = d$height, y = d$getlunch, g1 = d$travel, g1.level = "walk")
gi(x = d$height, y = d$getlunch, g1 = d$travel, bs.inference = TRUE, g1.level = "walk")

pl(x = d$height, y = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gs(x = d$height, y = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$height, y = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$height, y = d$getlunch, g1 = d$travel, bs.inference = TRUE, g2 = d$gender, g2.level = "male")


# ----------------------------------------------------------------------------- #
# X: Numeric
# Y: Numeric

upd()

pl(x = d$height, y = d$age, trend = "linear")
gs(x = d$height, y = d$age, trend = "linear")
gi(x = d$height, y = d$age, trend = "linear")
gi(x = d$height, y = d$age, trend = "linear", bs.inference = TRUE)

pl(x = d$height, y = d$age, g1 = d$travel, trend = "linear")
gs(x = d$height, y = d$age, g1 = d$travel, trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, trend = "linear", bs.inference = TRUE)

pl(x = d$height, y = d$age, g1 = d$travel, g1.level = "walk", trend = "linear")
gs(x = d$height, y = d$age, g1 = d$travel, g1.level = "walk", trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, g1.level = "walk", trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, trend = "linear", bs.inference = TRUE, g1.level = "walk")

pl(x = d$height, y = d$age, g1 = d$travel, g2 = d$gender, g2.level = "male", trend = "linear")
gs(x = d$height, y = d$age, g1 = d$travel, g2 = d$gender, g2.level = "male", trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, g2 = d$gender, g2.level = "male", trend = "linear")
gi(x = d$height, y = d$age, g1 = d$travel, bs.inference = TRUE, g2 = d$gender, g2.level = "male", trend = "linear")

upd()
pl(x = d$height, y = d$armspan, by = d$getlunch, trend = c("linear", "quadratic"))#,"cubic"))
pl(x = d$height, y = d$armspan, by = d$getlunch,
   trend = c("linear", "quadratic"), trend.by = TRUE)

# ----------------------------------------------------------------------------- #
# X: Factor
# Y: NULL

upd()

pl(x = d$getlunch)
gs(x = d$getlunch)
gi(x = d$getlunch)
gi(x = d$getlunch, bs.inference = TRUE)

pl(x = d$getlunch, g1 = d$travel)
gs(x = d$getlunch, g1 = d$travel)
gi(x = d$getlunch, g1 = d$travel)
gi(x = d$getlunch, g1 = d$travel, bs.inference = TRUE)

pl(x = d$getlunch, g1 = d$travel, g1.level = "walk")
gs(x = d$getlunch, g1 = d$travel, g1.level = "walk")
gi(x = d$getlunch, g1 = d$travel, g1.level = "walk")
gi(x = d$getlunch, g1 = d$travel, bs.inference = TRUE, g1.level = "walk")

pl(x = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gs(x = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$getlunch, g1 = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$getlunch, g1 = d$travel, bs.inference = TRUE, g2 = d$gender, g2.level = "male")


# ----------------------------------------------------------------------------- #
# X: Numeric   or   X: Factor
# Y: Factor         Y: Numeric

upd()

pl(x = d$getlunch, y = d$travel)
gs(x = d$getlunch, y = d$travel)
gi(x = d$getlunch, y = d$travel)
gi(x = d$getlunch, y = d$travel, bs.inference = TRUE)

pl(x = d$getlunch, y = d$travel, g1 = d$gender)
gs(x = d$getlunch, y = d$travel, g1 = d$gender)
gi(x = d$getlunch, y = d$travel, g1 = d$gender)
gi(x = d$getlunch, y = d$travel, g1 = d$gender, bs.inference = TRUE)

pl(x = d$getlunch, y = d$travel, g1 = d$gender, g1.level = "male")
gs(x = d$getlunch, y = d$travel, g1 = d$gender, g1.level = "male")
gi(x = d$getlunch, y = d$travel, g1 = d$gender, g1.level = "male")
gi(x = d$getlunch, y = d$travel, g1 = d$gender, bs.inference = TRUE, g1.level = "male")

pl(x = d$getlunch, y = d$travel, g2 = d$gender, g2.level = "male")
gs(x = d$getlunch, y = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$getlunch, y = d$travel, g2 = d$gender, g2.level = "male")
gi(x = d$getlunch, y = d$travel, bs.inference = TRUE, g2 = d$gender, g2.level = "male")


upd()
iNZightPlot(d$cellcost)
iNZightPlot(log(d$cellcost))

upd()
iNZightPlot(d$travel, d$getlunch)
iNZightPlot(d$travel, d$getlunch, inference.type = c("comp", "conf"))
iNZightPlot(d$travel, by = d$gender)


## TO DO:
#
# testingggg
# fix up the dotplot function
# guidelines to inference

upd()
iNZightPlot(d$height, inference.type = "comp")
iNZightPlot(d$height, d$travel, inference.type = "comp")
iNZightPlot(d$height, d$travel, g1 = d$getlunch, inference.type = "comp")
iNZightPlot(d$height, d$travel, inference.par = "mean", inference.type = c("comp"))
iNZightPlot(d$height, d$travel, inference.par = "mean", inference.type = c("comp", "conf"))
iNZightPlot(d$height, d$travel, inference.par = "mean", inference.type = "comp",
            bs.inference = TRUE)
iNZightPlot(d$height, d$travel, inference.par = "mean", inference.type = c("comp", "conf"),
            bs.inference = TRUE)

upd()
iNZightPlot(d$travel, inference.type = c("comp"))
iNZightPlot(d$travel, d$gender, inference.type = c("comp", "conf"))
iNZightPlot(d$travel, d$getlunch, inference.type = c("comp"), bs.inference = TRUE)




upd()
iNZightPlot(d$height, d$armspan, by = d$gender, trend = "linear")




#### TESTING:
x <- d$height
y <- d$rightfoot

plot(x, y)

col = ifelse(d$gender == "male", "blue", "red")
plot(x, y, col = col)

# add a trend
lin <- lm(y ~ x)
qua <- lm(y ~ x + I(x^2))
cub <- lm(y ~ x + I(x^2) + I(x^3))

xx <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = 1000)
yy <- predict(lin, data.frame(x = xx))
lines(xx, yy, col = "blue", lwd = 2)
yy <- predict(qua, data.frame(x = xx))
lines(xx, yy, col = "red", lwd = 2)
yy <- predict(cub, data.frame(x = xx))
lines(xx, yy, col = "green4", lwd = 2)

# by colour
g <- as.factor(d$gender)
xtmp <- lapply(levels(g), function(l) subset(x, g == l))
ytmp <- lapply(levels(g), function(l) subset(y, g == l))

col = ifelse(d$gender == "male", "blue", "red")
plot(x, y, col = col)
coltmp <- c("red", "blue")
for (i in 1:length(levels(g))) {
    x <- xtmp[[i]]
    y <- ytmp[[i]]
    col <- coltmp[i]
    
    lin <- lm(y ~ x)
    qua <- lm(y ~ x + I(x^2))
    cub <- lm(y ~ x + I(x^2) + I(x^3))

    xx <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = 1000)
    yy <- predict(lin, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 2, lty = 1)
    yy <- predict(qua, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 2, lty = 2)
    yy <- predict(cub, data.frame(x = xx))
   # lines(xx, yy, col = col, lwd = 3, lty = 3)
}


test <- function(c1, c2 = darken(c1)) {
    plot.new(); plot.window(xlim = 0:1, ylim = 0:1)
    rect(0, 0, 1, 1, col = c1)
    rect(0.2, 0.2, 0.8, 0.8, col = c2, lty = "2929")
}


darken <- function(x = "#FFFFFF") {
    x <- gsub('#', '', x)
    if (nchar(x) == 3)
        x <- paste(rep(strsplit(x, '')[[1]], each = 2), collapse = '')

    if (nchar(x) != 6)
        stop("Not a valid hexadecimal code!")

  # Now start the function!

    r <- substr(x, 1, 2)
    g <- substr(x, 3, 4)
    b <- substr(x, 5, 6)

    dark <- strtoi(c(r, g, b), base = 16) * 0.8 / 255
    
    rgb(dark[1], dark[2], dark[3])
}

## With darker lines:
x <- d$height; y <- d$rightfoot
cc <- hcl(1:2 / 2 * 360, 80, 30)
xx <- seq(100, 210, length = 1000)
col = ifelse(d$gender == "male", cc[1], cc[2])
pdf("multi_lines3.pdf")
plot(x, y, col = col)
coltmp <- c(cc[2], cc[1])
for (i in 1:length(levels(g))) {
    x <- xtmp[[i]]
    y <- ytmp[[i]]
    col <- darken(coltmp[i])
    
    lin <- lm(y ~ x)
    qua <- lm(y ~ x + I(x^2))
    cub <- lm(y ~ x + I(x^2) + I(x^3))

    yy <- predict(cub, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 2)
    yy <- predict(qua, data.frame(x = xx))
  #  lines(xx, yy, col = col, lwd = 2)
    yy <- predict(lin, data.frame(x = xx))
  #  lines(xx, yy, col = col, lwd = 2)
}
dev.off()




## OR
x <- d$height; y <- d$rightfoot
cc <- hcl(1:2 / 2 * 360, 80, 30)
xx <- seq(100, 210, length = 1000)
col = ifelse(d$gender == "male", cc[1], cc[2])
pdf("multi_lines2.pdf")
plot(x, y, col = col)
coltmp <- c(cc[2], cc[1])
for (i in 1:length(levels(g))) {
    x <- xtmp[[i]]
    y <- ytmp[[i]]
    col <- coltmp[i]
    
    lin <- lm(y ~ x)
    qua <- lm(y ~ x + I(x^2))
    cub <- lm(y ~ x + I(x^2) + I(x^3))

    yy <- predict(cub, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 4)
    lines(xx, yy, col = rgb(0, 0.9, 0), lwd = 2, lty = 2)
    yy <- predict(qua, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 4)
    lines(xx, yy, col = rgb(0.9, 0, 0), lwd = 2, lty = 2)
    yy <- predict(lin, data.frame(x = xx))
    lines(xx, yy, col = col, lwd = 4)
    lines(xx, yy, col = rgb(0, 0, 0.9), lwd = 2, lty = 2)
}
dev.off()

## Or black outlines?
cc <- hcl(1:2 / 2 * 360, 80, 30)
xx <- seq(100, 210, length = 1000)
col = ifelse(d$gender == "male", cc[1], cc[2])
pdf("multi_lines1.pdf")
plot(x, y, col = col)
coltmp <- c(cc[2], cc[1])
for (i in 1:length(levels(g))) {
    x <- xtmp[[i]]
    y <- ytmp[[i]]
    col <- coltmp[i]
    
    lin <- lm(y ~ x)
    qua <- lm(y ~ x + I(x^2))
    cub <- lm(y ~ x + I(x^2) + I(x^3))

    yy <- predict(cub, data.frame(x = xx))
    lines(xx, yy, col = "black", lwd = 4)
    lines(xx, yy, col = col, lwd = 3, lty = 3)
    yy <- predict(qua, data.frame(x = xx))
    lines(xx, yy, col = "black", lwd = 4)
    lines(xx, yy, col = col, lwd = 3, lty = 2)
    yy <- predict(lin, data.frame(x = xx))
    lines(xx, yy, col = "black", lwd = 4)
    lines(xx, yy, col = col, lwd = 3)
}
dev.off()


#################3
d <- read.csv("~/iNZight/data/Gap Minder Data.csv")

upd()
iNZightPlot(log(d$GDP.per.Capita), d$Life.Expectancy)
iNZightPlot(log(d$GDP.per.Capita), d$Life.Expectancy, g1 = d$Region,
            alpha = 0.5, pch = 19)

library(lattice)
xyplot(d$Life.Expectancy ~ log(d$GDP.per.Capita) | d$Region)


library(hexbin)
plot(hexbin(log(d$GDP.per.Capita), d$Life.Expectancy), style ="lattice")

################

upd()
getPlotSummary(d$getlunch, d$cellsource)
getPlotSummary(d$cellsource, d$getlunch)

getPlotSummary(d2$Year, d2$Region)
getPlotSummary(d2$Region, d2$Year)
