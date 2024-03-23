-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Dracula+"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.window_decorations = "RESIZE"

return config
