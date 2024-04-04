local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "Afterglow"

config.font = wezterm.font("Source Code Pro for Powerline", { weight = "Bold", italic = true })

config.audible_bell = "Disabled"

config.font_size = 10.5

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'Enter',
    mods = 'OPT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

config.enable_tab_bar = false

return config
