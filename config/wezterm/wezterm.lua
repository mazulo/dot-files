local wezterm = require("wezterm")
-- local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

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
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.SendKey({ key = "f", mods = "ALT" }),
	},
}

config.enable_tab_bar = false

-- smart_splits.apply_to_config(config, {
-- 	-- the default config is here, if you'd like to use the default keys,
-- 	-- you can omit this configuration table parameter and just use
-- 	-- smart_splits.apply_to_config(config)
--
-- 	-- directional keys to use in order of: left, down, up, right
-- 	-- direction_keys = { 'h', 'j', 'k', 'l' },
-- 	-- if you want to use separate direction keys for move vs. resize, you
-- 	-- can also do this:
-- 	direction_keys = {
-- 		move = { "h", "j", "k", "l" },
-- 		resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
-- 	},
-- 	-- modifier keys to combine with direction_keys
-- 	modifiers = {
-- 		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
-- 		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
-- 	},
-- 	-- log level to use: info, warn, error
-- 	log_level = "info",
-- })

return config
