local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Gogh (Gogh)"
config.font = wezterm.font("Source Code Pro for Powerline", { weight = "Bold", italic = true })
config.audible_bell = "Disabled"
config.font_size = 11
config.keys = {
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Enter",
		mods = "OPT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{ key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "Tab", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment },
	-- { key = "RightArrow", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	-- { key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment },
	-- { key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = wezterm.action.DisableDefaultAssignment },
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.SendKey({
			key = "Tab",
			mods = "OPT",
		}),
	},
	{
		key = "Tab",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SendKey({
			key = "Tab",
			mods = "SHIFT",
		}),
	},
	-- {
	-- 	key = "LeftArrow",
	-- 	mods = "CTRL",
	-- 	action = wezterm.action.SendKey({
	-- 		key = "b",
	-- 		mods = "CTRL",
	-- 	}),
	-- },
	-- {
	-- 	key = "RightArrow",
	-- 	mods = "CTRL",
	-- 	action = wezterm.action.SendKey({ key = "f", mods = "CTRL" }),
	-- },
}

config.enable_tab_bar = false

return config
