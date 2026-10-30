require("commands")

local mainMod = "Super"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Shift + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd('lekker-menu-system'))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('steam'))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd('discord'))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd('lekker-menu-clipboard'))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd('lekker-menu-keybinds'))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd('lekker-notes'))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd('spotify'))
hl.bind(mainMod .. " + Shift + M", hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'), { locked = true })

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd('lekker-menu'))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + Shift + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + Shift + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + Shift + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + Shift + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

hl.bind(mainMod .. " + Shift + 1", hl.dsp.window.move({ workspace = "1", follow = false }))
hl.bind(mainMod .. " + Shift + 2", hl.dsp.window.move({ workspace = "2", follow = false }))
hl.bind(mainMod .. " + Shift + 3", hl.dsp.window.move({ workspace = "3", follow = false }))
hl.bind(mainMod .. " + Shift + 4", hl.dsp.window.move({ workspace = "4", follow = false }))
hl.bind(mainMod .. " + Shift + 5", hl.dsp.window.move({ workspace = "5", follow = false }))
hl.bind(mainMod .. " + Shift + 6", hl.dsp.window.move({ workspace = "6", follow = false }))
hl.bind(mainMod .. " + Shift + 7", hl.dsp.window.move({ workspace = "7", follow = false }))
hl.bind(mainMod .. " + Shift + 8", hl.dsp.window.move({ workspace = "8", follow = false }))
hl.bind(mainMod .. " + Shift + 9", hl.dsp.window.move({ workspace = "9", follow = false }))
hl.bind(mainMod .. " + Shift + 0", hl.dsp.window.move({ workspace = "10", follow = false }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd('playerctl previous'), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
