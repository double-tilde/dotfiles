-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/
-- require("myColors")

local mainMod = "SUPER"

-- MONITORS --
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = "1.25",
})

hl.monitor({
	output   = "DP-2",
	mode     = "3840x2160@120",
	position = "auto",
	scale    = "1.25",
})

hl.monitor({
	output   = "eDP-1",
	mode     = "preferred",
	position = "auto",
	scale    = "1",
})

-- MY PROGRAMS --
-- Set programs that you use

local terminal      = "kitty"
local fileManager   = "thunar"
local menu          = "rofi -show drun"
local menuWebSearch = "rofi-web-search.sh"
local browser       = "firefox"
local notes         = "obsidian --enable-features=UseOzonePlatform --ozone-platform-hint=wayland"
local graphics      = "gimp"
local vpn           = "mullvad-vpn"
local music           = "bitwig-studio"
local emoji         = "gnome-characters"

-- Lock the screen after 20 minutes
local lock          =
"swaylock --image ~/.local/wallpapers/landing.jpg --effect-blur 7x5 --clock --indicator --indicator-radius 100 --indicator-thickness 7 --ring-color ffffffaa --ring-clear-color ffffffaa --ring-ver-color ffffffaa --ring-wrong-color ffffffaa --key-hl-color ffffff --bs-hl-color ffffff --text-color ffffff --text-clear-color ffffff --text-ver-color ffffff --text-wrong-color ffffff --inside-color 00000088 --inside-clear-color 00000088 --inside-ver-color 00000088 --inside-wrong-color 00000088 --line-color 00000000 --separator-color 00000000"
local locktimer     = "swayidle -w timeout 1200 " .. lock

-- AUTOSTART --
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal .. " -e ~/.local/scripts/tmux-startup.sh", { workspace = "1" })
	hl.exec_cmd(browser, { workspace = "2" })
	hl.exec_cmd(notes, { workspace = "3" })
	hl.exec_cmd("swaync & waybar & hyprpaper & hyprctl setcursor phinger-cursors-light 24 &")
	hl.exec_cmd(locktimer)
end)

-- ENVIRONMENT VARIABLES --
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "phinger-cursors-light")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- PERMISSIONS --
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-- LOOK AND FEEL --
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in          = 0,
		gaps_out         = 0,

		border_size      = 1,

		col              = {
			active_border   = { colors = { "rgba(92a2d5ff)", "rgba(85b5baff)" }, angle = 45 },
			inactive_border = "rgba(3b3b3eff)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing    = false,

		layout           = "dwindle",
	},

	decoration = {
		rounding         = 0,
		rounding_power   = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 0.9,

		shadow           = {
			enabled      = true,
			range        = 8,
			render_power = 3,
			color        = 0x1a1a1a33,
		},

		blur             = {
			enabled  = true,
			size     = 2,
			passes   = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "quick", style = "slide 10%" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "default", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "quick", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "quick", style = "slidefade 5%" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

--  MISC  --

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
		middle_click_paste      = false,
		focus_on_activate       = true,
	},
})


-- INPUT --

hl.config({
	input = {
		kb_layout     = "gb",
		kb_rules      = "",
		kb_options    = "caps:swapescape",

		follow_mouse  = 1,
		sensitivity   = 0, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		touchpad      = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

hl.device({
	name        = "asue1409:00-04f3:3157-touchpad",
	sensitivity = 0.5,
})

-- KEYBINDINGS --
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("~/.local/scripts/powermenu.sh"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menuWebSearch))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(music))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd(emoji))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit")) -- dwindle only

-- Screenshots
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

-- Move focus with mainMod + home row keys
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Resize the active window with mainMod + ALT + home row keys
hl.bind(mainMod .. " + ALT + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }))
hl.bind(mainMod .. " + ALT + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }))
hl.bind(mainMod .. " + ALT + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


-- WINDOWS AND WORKSPACES --
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name           = "suppress-maximize-events",
	match          = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	-- This should help Bitwig
	name     = "fix-xwayland-drags",
	match    = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name  = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move  = "20 monitor_h-120",
	float = true,
})

