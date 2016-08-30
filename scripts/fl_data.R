setwd("~/iNZight/FutureLearnData")

## Gapminder Data
gapminder_2008 <- read.csv("~/Downloads/FutureLearn/Gapminder-2008.csv", header=TRUE, comment.char="#")
devtools::use_data(gapminder_2008)

gapminder <- read.csv("~/Downloads/FutureLearn/Gapminder.csv", header=TRUE, comment.char="#")
devtools::use_data(gapminder)


## NHANES Data
nhanes_1000_50 <- read.csv("~/Downloads/FutureLearn/NHANES-1000-50.csv", header = TRUE, comment.char = "#")
devtools::use_data(nhanes_1000_50)

nhanes_1000 <- read.csv("~/Downloads/FutureLearn/NHANES-1000.csv", header = TRUE, comment.char = "#")
devtools::use_data(nhanes_1000)

nhanes_2000 <- read.csv("~/Downloads/FutureLearn/NHANES-2000.csv", header = TRUE, comment.char = "#")
devtools::use_data(nhanes_2000)

nhanes2009_2012 <- read.csv("~/Downloads/FutureLearn/NHANES2009-2012.csv", header = TRUE, comment.char = "#")
devtools::use_data(nhanes2009_2012)


## Olympics Data
olympics100m <-
    read.csv("~/Downloads/FutureLearn/olympics100m.csv", header = TRUE, fileEncoding="ISO-8859-9")
## fix weird character
sapply(olympics100m$location, function(x) {
    x <- as.character(x)
    y <- gregexpr("[A-Z]{3}", x)[[1]]
    substr(x, y, nchar(x))
}) -> fix
olympics100m$location <- as.factor(fix)

sapply(olympics100m$TIME, function(x) {
    x <- as.character(x)
    y <- gregexpr("[0-9]", x)[[1]]
    substr(x, min(y), max(y))
}) -> fix
olympics100m$TIME <- as.numeric(fix)

devtools::use_data(olympics100m)



### Week 7:
files7 <-list.files("~/Downloads/FutureLearn/Week 7", ".csv")
for (f in files7) {
    o <- paste0("week7_", gsub(".csv", "", gsub("-", "_", f)))
    assign(o, read.csv(file.path("~/Downloads/FutureLearn/Week 7", f), header = TRUE, comment.char = "#"))
    eval(parse(text = paste0("devtools::use_data(", o, ", overwrite = TRUE)")))
    rm(o, f)
}


### Week 8:
files8 <-list.files("~/Downloads/FutureLearn/Week 8", ".csv")
for (f in files8) {
    o <- paste0("week8_", gsub(".csv", "", gsub(" ", "_", f)))
    assign(o, read.csv(file.path("~/Downloads/FutureLearn/Week 8", f), header = TRUE, comment.char = "#"))
    eval(parse(text = paste0("devtools::use_data(", o, ", overwrite = TRUE)")))
}



## Documentation
devtools::document()
devtools::check()

#devtools::load_all()
