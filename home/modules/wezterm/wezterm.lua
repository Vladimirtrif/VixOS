local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.default_cursor_style = 'SteadyBar'
config.cursor_thickness = 3
return config