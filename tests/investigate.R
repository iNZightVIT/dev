q()
library(devtools)
lib <- "~/iNZight/iNZightPlots"
lib <- "~/iNZight/iNZight"
load_all(lib)
pkg <- build(lib)
system(paste("R CMD INSTALL", pkg)); q()

library(iNZightPlots); d <- read.csv("~/Downloads/NHANES-1000.csv", header = TRUE)
iNZightPlot(d$AgeFirstMarij, inference.type = c("comp", "conf"), inference.par = "mean")
iNZightPlot(d$AgeFirstMarij, inference.type = "comp", inference.par = "mean")
iNZightPlot(d$AgeFirstMarij, inference.type = "conf", inference.par = "mean")





iNZightPlot(d$AgeFirstMarij, d$AgeDecade)
getPlotInference(d$AgeFirstMarij, d$AgeDecade)



iNZightPlot(d$Education, d$AgeDecade, inference.type = c("comp", "conf"))

Y <- d$AgeDecade
names <- levels(Y)
Nlev <- length(levels(Y))
rns <- c()
for (i in 1:(Nlev-1))
    rns <- c(rns, paste(names[i], " - ", names[(i+1):Nlev]))

fit <- lm(d$AgeFirstMarij ~ d$AgeDecade)
mult.comp <- s20x:::multipleComp(fit)
mult.comp.df <- as.data.frame(mult.comp)
mult.comp.df$name <- rownames(mult.comp.df)

fake <- data.frame(name=rns)
mult.comp <- as.matrix(merge(mult.comp.df, fake, by = "name", all.y = TRUE)[, -1])
rownames(mult.comp) <- rns

iNZightPlots:::triangularMatrix(names, mult.comp, "estimates")


t(table(d$Education, d$AgeDecade))
