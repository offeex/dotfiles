-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local font = wezterm.font('JetBrains Mono', { weight = 'Medium' })

-- This is where you actually apply your config choices
config.term = "wezterm"
config.font = font

-- For example, changing the color scheme:
config.color_scheme = 'Calamity'
config.window_background_opacity = 0.75
config.window_padding = {
  left = 8,
  right = 8,
  top = 4,
  bottom = 4,
}

config.window_close_confirmation = 'NeverPrompt'

-- tab-bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 28

-- text_cursor
config.default_cursor_style = 'BlinkingBar'
config.animation_fps = 1
config.cursor_blink_rate = 600

-- Muxing
config.keys = {
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

-- and finally, return the configuration to wezterm
return config
