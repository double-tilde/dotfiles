--
-- ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~
-- ~~  WEZTERM  CONFIG  ~~
-- ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~
--

-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Open WSL by default
config.wsl_domains = {
	{
		name = "WSL:Ubuntu-24.04",
		distribution = "Ubuntu-24.04",
		default_cwd = "~",
		default_prog = { "zsh", "-c", "tmux" },
	},
}
config.default_domain = "WSL:Ubuntu-24.04"

-- Color Settings
config.term = "xterm-256color"

-- Old World Colors
config.colors = {
	cursor_bg = "#C9C7CD",
	cursor_border = "#C9C7CD",

	cursor_fg = "#161617",
	background = "#161617",
	foreground = "#C9C7CD",

	selection_bg = "#B7AED5",
	selection_fg = "#C9C7CD",

	-- Tab bar allows tmux like tabs
	tab_bar = {
		background = "#161617",
		inactive_tab = {
			bg_color = "#161617",
			fg_color = "#C9C7CD",
		},
		active_tab = {
			bg_color = "#92ADD5",
			fg_color = "#161617",
			intensity = "Bold",
		},
		new_tab = {
			bg_color = "#161617",
			fg_color = "#C9C7CD",
		},
		new_tab_hover = {
			bg_color = "#92ADD5",
			fg_color = "#161617",
		},
	},

	ansi = {
		"#161617",
		"#EA83A5",
		"#90B99F",
		"#E6B99D",
		"#92A2D5",
		"#E29ECA",
		"#85B5BA",
		"#B4B1BA",
	},
	brights = {
		"#353539",
		"#ED96B3",
		"#A7C8B3",
		"#EAC5AE",
		"#A7B3DD",
		"#E8B0D4",
		"#97C0C4",
		"#C9C7CD",
	},
}

-- Cursor Settings
config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500

-- Font Settings
config.font = wezterm.font("GeistMono Nerd Font")
config.prefer_egl = true
config.font_size = 19.0

-- Window Settings
config.window_decorations = "NONE | RESIZE"
-- config.window_background_image = "./wezterm.jpg"
config.window_background_opacity = 1.0
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Multiplex Settings - Same main bindings as tmux
-- config.leader = { mods = "CTRL", key = "Space" }
-- config.keys = {
-- 	{
-- 		mods = "LEADER",
-- 		key = "w",
-- 		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "c",
-- 		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "x",
-- 		action = wezterm.action.CloseCurrentPane({ confirm = true }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "%",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "\"",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "h",
-- 		action = wezterm.action.ActivatePaneDirection("Left"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "j",
-- 		action = wezterm.action.ActivatePaneDirection("Down"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "k",
-- 		action = wezterm.action.ActivatePaneDirection("Up"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "l",
-- 		action = wezterm.action.ActivatePaneDirection("Right"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "LeftArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "RightArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "DownArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "UpArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
-- 	},
-- }

-- Open a tab with LEADER + [1+9]
-- for i = 0, 8 do
-- 	table.insert(config.keys, {
-- 		key = tostring(i + 1),
-- 		mods = "LEADER",
-- 		action = wezterm.action.ActivateTab(i),
-- 	})
-- end

-- Tabs Settings
-- config.hide_tab_bar_if_only_one_tab = false
config.hide_tab_bar_if_only_one_tab = true
-- config.use_fancy_tab_bar = false
-- config.tab_and_split_indices_are_zero_based = false

return config
