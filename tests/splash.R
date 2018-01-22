grid::grid.newpage()
grid::pushViewport(grid::viewport(
    height = unit(0.8, "npc"),
    layout = grid::grid.layout(nrow = 3, ncol = 1,
                               heights = unit.c(unit(0.2, "npc"),
                                                unit(2.5, "lines"),
                                                unit(1, "null")))
))

grid::pushViewport(grid::viewport(layout.pos.row = 1))
grid::grid.raster(img)
grid::upViewport()

grid::pushViewport(grid::viewport(layout.pos.row = 2))
grid::grid.text("Version 3.2",
                x = unit(0.8, "npc"), y = unit(0.75, "npc"),
                just = 'right')
grid::grid.text("Release date: 23 Jan 2018",
                x = unit(0.8, "npc"), y = unit(0.25, "npc"),
                just = 'right', gp = gpar(fontsize = 9))
