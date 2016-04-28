library(devtools)
install_github("tslumley/hextri")
library(hextri)

data <- read.csv("~/iNZight/data/Census at School-500.csv",header=TRUE,comment.char="#")

rval <- hextri(data$height, data$armspan, class = data$gender, colours = c("red", "blue"), nbins = 20)
