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

-- Open WSL by default - At work I use a different distro
local hostname = wezterm.hostname()
if hostname == "AmysDesktop" then
	config.default_domain = "WSL:Ubuntu"
else
	config.default_domain = "WSL:Ubuntu-20.04"
end

-- Color Settings
config.term = "xterm-256color"

config.colors = {
	cursor_bg = "#C9C7CD",
	cursor_border = "#C9C7CD",

	cursor_fg = "#161617",
	background = "#161617",
	foreground = "#C9C7CD",

	selection_bg = "#B7AED5",
	selection_fg = "#C9C7CD",

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
config.font_size = 13.0

-- Tab Settings
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Window Settings
config.window_decorations = "NONE | RESIZE"
config.window_background_opacity = 1.0
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

return config
