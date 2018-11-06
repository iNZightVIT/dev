library(devtools)

load_all("~/iNZight/iNZightRegression")
#data("gapminder", package = "iNZight")
#dat <- gapminder
data("census.at.school.500", package = "iNZight")
dat <- census.at.school.500

fit <- lm(height ~ armspan + age + year, data = dat)
fit2 <- glm(gender ~ armspan, data = dat,
            family = binomial)

## load_all("~/iNZight/iNZightRegression")
## e <- new.env()
## assign("dat", dat, envir = e)
## rm(dat)

load_all("~/iNZight/iNZightRegression")
fit <- lm(height ~ armspan + sqrt(age) + relevel(gender, "male") +
              travel * getlunch, data = dat)
plotlm6(fit, 7)

load_all("~/iNZight/iNZightRegression")
fit <- lm(height ~ armspan + gender + sqrt(age) + relevel(gender, "male") +
              travel * getlunch,
          data = dat)
iNZightQQplot(fit)
histogramArray(fit)




load_all("~/iNZight/iNZightRegression")
fit <- lm(Infantmortality ~ ChildrenPerWoman, data = dat)
plotlm6(fit, 1)

plot(fitted(fit), residuals(fit))
sm <- loess(residuals(fit) ~ fitted(fit))
o <- order(sm$x)
lines(sm$x[o], sm$fitted[o], col = "orangered", lwd = 4)

## manual bootstrap
##boot.list <- replicate(30, dat[sample(nrow(fit$model), replace = TRUE), ],
##                       simplify = FALSE)
##fit.list <- lapply(boot.list,
##                   function(x) lm(Infantmortality ~ ChildrenPerWoman, data = x))
fit.list <- replicate(30, {
    update(fit, subset = sample(nrow(dat), replace = TRUE))
}, simplify = FALSE)
res.list <- lapply(fit.list, function(x) loess(residuals(x) ~ fitted(x)))
plot(fitted(fit), residuals(fit))
invisible(sapply(res.list, function(x)
    lines(x$x[order(x$x)], x$fitted[order(x$x)], col = "green")))
lines(sm$x[o], sm$fitted[o], col = "orangered", lwd = 4)

dev.new()
plotlm6(fit, 1)




load_all("~/iNZight/iNZightRegression")
fit <- lm(height ~ age, data = dat)
iNZightSummary(fit, exclude = "age")


load_all("~/iNZight/iNZightRegression")
fit <- glm(gender ~ rightfoot + age, data = dat, family = binomial())
iNZightSummary(fit)
