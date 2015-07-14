library(barcode)
library(gpairs)

d <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#")

chosenVarIndices <- c(1:5)

#grpVar <- ""
grpVar <- "gender"

if (grpVar == "") {
    scatter.pars <- NULL
    stripplot.pars <- list(jitter.data = TRUE)
} else {
    scatter.pars <- list(col = as.numeric(d[, grpVar]))
    stripplot.pars <- list(jitter.data = TRUE,
                           col = as.numeric(d[, grpVar]))
}

gpairs(d[, chosenVarIndices],
       upper.pars = list(conditional = "stripplot"),
       scatter.pars = scatter.pars,
       stripplot.pars = stripplot.pars)
