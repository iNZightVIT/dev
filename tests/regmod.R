library(devtools)

load_all("~/iNZight/iNZightRegression")
data("census.at.school.500", package = "iNZight")
dat <- census.at.school.500

fit <- lm(height ~ armspan + age + year, data = dat)
fit2 <- glm(gender ~ armspan, data = dat,
            family = binomial)

## load_all("~/iNZight/iNZightRegression")
## e <- new.env()
## assign("dat", dat, envir = e)
## rm(dat)

plotlm6(fit, 1)
partialResPlot(fit, "armspan")

plotlm6(fit, 1, env = e)

plotlm6(fit2, 7)


bs.fits <- replicate(30, {
    update(fit, subset = sample(nrow(dat), replace = TRUE))
}, simplify = FALSE)

update(fit, subset = sample(nrow(dat), replace = TRUE))

boot <- function(fit, N = 20, ...) UseMethod("boot")
boot.lm <- function(fit, N = 20, ...) {
    X <- model.matrix(fit)
    ii <- sample(nrow(X), replace = TRUE)
    Yi <- X[ii, 1]
    Xi <- X[ii, -1]
    Bhat <- solve(t(Xi) %*% Xi, t(Xi) %*% Yi)
    Yhat <- Xi %*% Bhat
    res <- Yi - Yhat
}
