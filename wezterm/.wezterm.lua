-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- font configs
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16

-- window configs
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.initial_cols = 122
config.initial_rows = 36

-- color configs
config.colors = {
	cursor_bg = "white",
}

-- Finally, return the configuration to wezterm:
return config
