local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- temporary fix
config.enable_wayland = false

-- general
config.enable_tab_bar = false

config.font = wezterm.font {
  family = "JetBrains Mono",
}

config.font_size = 16.0

-- theme
config.window_background_opacity = 0.90
config.color_scheme = 'Oxocarbon Dark (Gogh)'

config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

-- keybindings
config.keys = {
  { key = 'Backspace', mods = 'CTRL', action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' } },
}

return config
