local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi"

require("scripts.vinegar-spotify")

hl.config({
    cursor = {
        no_hardware_cursors = true,
        inactive_timeout = 0
    },

    general = {
        ["col.active_border"] = "#9A5A52",
        ["col.inactive_border"] = "#906e69"
    },

    decoration = {
        rounding = 10,
        rounding_power = 2.00,
    },
})

-- dont forget to change so your display doesn't get cooked
hl.monitor({
  output = "DP-3",
  mode = "2560x1440@165.00Hz",
  position = "0x0",
  scale = 1,
})

hl.on("hyprland.start", function () 
    hl.exec_cmd(terminal)
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
end)

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod.. " + S", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind(mainMod.. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. tostring(key),             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. tostring(key),     hl.dsp.window.move({ workspace = i }))
end


hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.0, dampening = 12.0 })

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })


hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "easeOutQuint", style = "slide" })
