local wezterm = require 'wezterm';

return {
	keys = { {
		key = 'F11',
		action = wezterm.action.ToggleFullScreen,
	} },
	font = wezterm.font('IosevkaTerm Nerd Font'),
	font_size = 14.0,
	line_height = 1.2,
	default_cursor_style = "BlinkingBar",
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
        window_background_opacity = 0.91,
        window_padding = {
          left = 0,
          right = 0,
          bottom = 0,
          top = 0,
        },
        dpi = 192,
}
