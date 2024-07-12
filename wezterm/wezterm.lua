local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- general
config.enable_tab_bar = false

config.font = wezterm.font {
  family = "JetBrains Mono",
}

config.font_size = 16.0

-- theme
config.window_background_opacity = 0.90
config.color_scheme = 'Oxocarbon Dark (Gogh)'

-- keybindings
config.keys = {
  { key = 'Backspace', mods = 'CTRL', action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' } },
}

-- temporary fix
config.enable_wayland = false

return config
