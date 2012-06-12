dofile("/etc/xdg/awesome/rc.lua")
require("eminent") -- https://awesome.naquadah.org/wiki/Eminent

editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

mod = "Mod4"

awful.menu.menu_keys.up = { "k", "Up" }
awful.menu.menu_keys.down = { "j", "Down" }
awful.menu.menu_keys.back = { "h", "Left" }
awful.menu.menu_keys.exec = { "l", "Right", "Return" }
awful.menu.menu_keys.close = { "Escape" }

mylayouts = {
    layouts[2],
    layouts[10],
    layouts[2],
    layouts[2],
    layouts[2],
    layouts[2],
    layouts[1],
    layouts[1],
    layouts[1]
}

for s = 1, screen.count() do
    for t = 1, 9 do
        awful.tag.setproperty(tags[s][t], "layout", mylayouts[t])
    end
end
