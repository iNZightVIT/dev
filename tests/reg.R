upd <- function() {
    invisible(lapply(list.files("~/iNZight/iNZightRegression/R/",
                                full.names = TRUE), source))
    invisible(lapply(list.files("~/iNZight/iNZightPlots/R/",
                                full.names = TRUE), source))
    library(grid)
}

upd()
d <- read.csv('~/iNZight/data/Census at School-500.csv')
d2 <- read.csv('~/iNZight/data/Gap Minder Data.csv')

fit <- lm(height ~ age + armspan + gender, data = d)
plotlm6(fit, which = 7)

allPartialResPlots(fit)



fit2 <- lm(Life.Expectancy ~ (Population) + GDP.per.Capita + Region,
           data = d2)
plotlm6(fit2, which = 7)
upd()
allPartialResPlots(fit2)


d3 <- read.csv("~/iNZight/iNZightVIT-WIN/data/NZIncomes03_34000.csv")
fit3 <- lm(weekly_income ~ weekly_hrs + ethnicity, data = d3)
plotlm6(fit3)
upd()
allPartialResPlots(fit3)
