hl.curve("easeInOutCubic", {type = "bezier", points = { { 0.65, 0 }, { 0.35, 1 } } })
hl.curve("easeOutCubic", {type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeInCubic", {type = "bezier", points = { { 0.32, 0 }, { 0.67, 0 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.4, bezier = "easeOutCubic", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.4, bezier = "easeOutCubic", style = "popin 60%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.6, bezier = "easeOutCubic" })

hl.animation({ leaf = "layersIn", enabled = true, speed = 2.4, bezier = "easeOutCubic", style = "popin 60%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.4, bezier = "easeInCubic", style = "popin 60%" })

hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.4, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.6, bezier = "easeInCubic" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 2.4, bezier = "easeOutCubic" })

hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2.4, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.4, bezier = "easeInCubic" })
hl.animation({ leaf = "fadePopupsIn", enabled = true, speed = 2.4, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadePopupsOut", enabled = true, speed = 2.4, bezier = "easeInCubic" })
hl.animation({ leaf = "fadeDpms", enabled = true, speed = 2.4, bezier = "easeOutCubic" })

hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({ leaf = "workspaces", enabled = false })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = 4, bezier = "easeInCubic" })
