q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightMR")


try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
KK <- iNZGUI$new()

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/Gap Minder Data.csv",
                               header = TRUE, comment.char = "#"))


library(survey)
data(api)
KK$initializeGui(apiclus2)


KK$initializeGui(D <- read.csv("~/Downloads/NZ_earthquakes2010.csv",
                               header = TRUE, comment.char = "#"))


KK$initializeGui(D <- read.csv("~/Downloads/sampleLoan20072011.csv", header = TRUE))


x <- D$armspan
y <- D$height

mat <- cbind(x, y)
d <- mahalanobis(mat, colMeans(mat, na.rm = TRUE), cov(mat, use = "complete.obs"))
o <- order(d, decreasing = TRUE)
mat[o[1:3], ]
