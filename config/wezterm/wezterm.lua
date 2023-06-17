local wezterm = require 'wezterm';

return {
	keys = { {
		key = 'F11',
		action = wezterm.action.ToggleFullScreen,
	} },
	font = wezterm.font('Iosevka Nerd Font'),
	font_size = 14.0,
	default_cursor_style = "BlinkingBar",
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "shades-of-purple",
}
