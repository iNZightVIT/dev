###  Example: Interactive Sampling
###
###  Libraries
library(grid)
library(gridSVG)

###  Initial parameters
n = 30
x = rnorm(n)

###  Set up viewports.
tit = "Example: Interactive Sampling"
vp =
    function(y, height = .2, just = "bottom", xscale = range(x), ...)
        viewport(y = y, height = height,
                 just = just, xscale = xscale, ...)

manvp = viewport(width = .8, xscale = range(x))
topvp = vp(y = .7)
midvp = vp(y = .5)
botvp = vp(y = .3)

grect =
    function(width = 1.2, y = 0, xsc = range(x), jst = "bottom",
             hgt = c(.2, .5), gp = gpar(col = NA, fill = "grey95")) {
        grid.rect(width = width, height = hgt[2],
                  y = y, just = jst, gp = gp)
        grid.xaxis()
        popViewport()
    }

grid.newpage()

pushViewport(manvp)

pushViewport(topvp)
grid.text(tit, vp = topvp)
grect()

pushViewport(midvp)
grect()

pushViewport(botvp)
grect()

###  Add points.
cy = unit(.75, "npc")
cr = unit(1, "mm")
gp = gpar(col = "blue", fill = rgb(0, 0, 1, .25))
dur = 10

grid.circle(unit(x, "native"), y = cy, r = cr)

###  Animate points.
nsample = 1 0
sample = sample(1:n, nsample)

for (i in seq_along(sample)) {
    cg = circleGrob(unit(x[sample[i]], "native"), y = cy, r = cr, gp = gp)
    gcg = garnishGrob(cg, visibility = "hidden")
    acg = animateGrob(gcg, y = rep(c(.75, .55), c(i, nsample - i + 1)),
                      visibility = rep(c("hidden", "visible"),
                          c(i - 1, nsample - i + 2)), duration = dur)
    grid.draw(acg)
}

###  Draw boxplot.


###  Draw boxes.
summ = unit(summary(x[sample]), "native")
lab = paste0("rect", 1:4)
just = "left"

draw.box =
    function(xi, wi, wj, yi, li, hgt = .05, y = c(.55, .35),
             gp = gpar(col = "red", fill = rgb(1, 0, 0, .2))) 
        grid.rect(x = summ[xi], width = summ[wi] - summ[wj],
                  y = y[yi], height = hgt, just = jst,
                  gp = gp, name = lab[li])

draw.box(xi = 1, wi = 2, wj = 1, yi = 1, li = 1, hgt = 1e-5)
draw.box(xi = 5, wi = 6, wj = 5, yi = 1, li = 2, hgt = 1e-5)
draw.box(xi = 2, wi = 3, wj = 2, yi = 1, li = 3)
draw.box(xi = 3, wi = 5, wj = 3, yi = 1, li = 4)

###  Animate Boxplot.
vis = rep(c("hidden", "visible"), c(nsample, 2))
y2 = rep(c(.55, .35), c(nsample + 1, 1))
dur2 = dur + 2

sapply(lab, function(x) grid.garnish(path = x,
                                     visibility = vis[1]))

sapply(lab, function(x) grid.animate(path = x,
                                     y = y2,
                                     duration = dur2,
                                     visibility = vis))
popViewport()

###  Export as SVG.
suppressWarnings(grid.export("wildAnim.svg"))
dev.off()
system('firefox wildAnim.svg')

 
