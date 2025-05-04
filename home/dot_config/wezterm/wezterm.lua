-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Dracula+"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.window_decorations = "RESIZE"

-- multiplexing
-- config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = true
-- -- Don't let any individual tab name take too much room
-- config.tab_max_width = 32
-- config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
--     -- splitting
--     {
--         mods = "LEADER",
--         key = "|",
--         action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
--     },
--     {
--         mods = "LEADER",
--         key = "_",
--         action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
--     },
--     {
--         mods = "LEADER",
--         key = "z",
--         action = wezterm.action.TogglePaneZoomState,
--     },
--     -- rotate panes
--     {
--         mods = "LEADER",
--         key = "Space",
--         action = wezterm.action.RotatePanes("Clockwise"),
--     },
--     -- show the pane selection mode, but have it swap the active and selected panes
--     {
--         mods = "LEADER",
--         key = "0",
--         action = wezterm.action.PaneSelect({
--             mode = "SwapWithActive",
--         }),
--     },
--     -- activate copy mode or vim mode
--     {
--         mods = "LEADER",
--         key = "[",
--         action = wezterm.action.ActivateCopyMode,
--     },
--     {
--         key = "c",
--         mods = "LEADER",
--         action = wezterm.action.SpawnTab("CurrentPaneDomain"),
--     },
--     {
--         key = "n",
--         mods = "LEADER",
--         action = wezterm.action.ActivateTabRelative(1),
--     },
--     {
--         key = "p",
--         mods = "LEADER",
--         action = wezterm.action.ActivateTabRelative(-1),
--     },
--     {
--         key = ",",
--         mods = "LEADER",
--         action = wezterm.action.PromptInputLine({
--             description = "Enter new name for tab",
--             action = wezterm.action_callback(function(window, pane, line)
--                 if line then
--                     window:active_tab():set_title(line)
--                 end
--             end),
--         }),
--     },
--     {
--         key = "w",
--         mods = "LEADER",
--         action = wezterm.action.ShowTabNavigator,
--     },
-- }
--
return config
