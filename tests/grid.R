library(grid)
grid.newpage()

pushViewport(viewport(0.5, 0.5,
                      width = 0.8, height = 0.8))
grid.rect()
grid.xaxis()
grid.yaxis()

grid.lines(0.2, c(0, 1)); grid.lines(0.4, c(0, 1))
grid.lines(c(0, 1), 0.2); grid.lines(c(0, 1), 0.4)
grid.points(0.3, 0.3, pch = 15, size = unit(0.2, "npc") * 1.35)

grid.lines(0.5, c(0, 1)); grid.lines(0.6, c(0, 1))
grid.lines(c(0, 1), 0.5); grid.lines(c(0, 1), 0.6)
grid.points(0.55, 0.55, pch = 15, size = unit(0.1, "npc") * 1.35,
            gp = gpar(col = "red"))
