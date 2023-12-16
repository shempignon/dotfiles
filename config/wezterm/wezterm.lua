local wezterm = require 'wezterm';

return {
	keys = { {
		key = 'F11',
		action = wezterm.action.ToggleFullScreen,
	} },
	font = wezterm.font('Victor Mono'),
	font_size = 14.0,
	line_height = 1.1,
	default_cursor_style = "BlinkingBar",
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Tokyo Night Moon",
}
