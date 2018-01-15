library(devtools)
#library(tidyverse)

##install_github("iNZightVIT/iNZightTS@dev")
##library(iNZightTS)
load_all("~/iNZight/iNZightTS")
document("~/iNZight/iNZightTS")
data("visitorsQ")
data("visitorsA2")

load_all("~/iNZight/iNZightTS")
ta <- iNZightTS(visitorsA2, var = "Australia")
P1 <- plot(ta, t = 20, ylab = "Visitors")

tq <- iNZightTS(visitorsQ, var = "Australia")
P2 <- plot(tq, t = 20, ylab = "Visitors", title = "%var")

d <- decompositionplot(ts, t = 10)
recompose(d)

load_all("~/iNZight/iNZightTS")
ta2 <- iNZightTS(visitorsA2, var = colnames(visitorsA2)[2:3])
s <- plot(ta2, title = "Visitors from %var", ylab = "Visitors",
          multiplicative = FALSE)

load_all("~/iNZight/iNZightTS")
tq2 <- iNZightTS(visitorsQ, var = colnames(visitorsQ)[2:5])
s <- plot(tq2, title = "Visitors from %var", ylab = "Visitors",
          multiplicative = FALSE)

load_all("~/iNZight/iNZightTS")
plot(ta2, compare = F)

load_all("~/iNZight/iNZightTS")
plot(tq2, compare = F, ylab = "Visitors")
plot(tq2, compare = F, ylab = "Visitors", multiplicative = T)




rawplot(tq2)


data <- data.frame(Date = as.numeric(time(ts$tsObj)))
                   Visitors = as.matrix(ts$tsObj))

tsPlot <- function(data) {
    pl <- ggplot(data, aes(x = Date, y = Visitors)) +
        geom_point()
    pl
    for (i in 1:nrow(data)) {
        dev.hold()
        print(pl + geom_line(data = data[1:i, ]))
        dev.flush()
        Sys.sleep(ifelse(i <= 9, 0.6, 0.05))
    }
    
    pl <- ggplot(data, aes(x = Date, y = Visitors)) +
        geom_line() +
        geom_smooth(se = F, col = "red", span = 0.5)
    dev.hold()
    print(pl)
    dev.flush()
}

## the smoother isn't the correct type, but that would be easy enough
## to grab from the current plot
dev.new(width = 10, height = 3)
tsPlot(data)

## versus
rawplot(ts, t = 20, animate = TRUE)

