local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%a %b %-d %H:%M'
  window:set_right_status(wezterm.format {
    { Attribute = { Underline = 'None' } },
    { Foreground = { AnsiColor = 'White' } },
    { Text = date },
  })
end)

local config = {}

config.audible_bell = 'Disabled'
config.colors = {
   tab_bar = {
      active_tab = {
         bg_color = '#000000',
         fg_color = '#c0c0c0',
      },
      background = '#000000',
      inactive_tab = {
         bg_color = '#000000',
         fg_color = '#808080',
      }
   }
}
config.debug_key_events = true
config.enable_tab_bar = true
config.font = wezterm.font 'DejaVu Sans Mono'
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 255
config.initial_rows = 75
config.selection_word_boundary = ' \t\n*?[]~&;!#$%^(){}<>:=̈\"'
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.use_ime = true
config.window_decorations = "RESIZE"
config.window_frame = {
   font_size = 20.0,
}

config.keys = {
   {
      key = 'n',
      mods = 'SHIFT|CTRL',
      action = act.ToggleFullScreen,
   },
}

local copy_mode = wezterm.gui.default_key_tables().copy_mode
table.insert(copy_mode,
  { key = 'a', mods = 'CTRL', action = act.CopyMode 'MoveToStartOfLine' }
)
table.insert(copy_mode,
  { key = 'e', mods = 'CTRL', action = act.CopyMode 'MoveToEndOfLineContent' }
)
table.insert(copy_mode,
  { key = 'Space', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Cell' } }
)
table.insert(copy_mode,
  { key = 'w', mods = 'ALT', action = act.Multiple {
       { CopyTo = 'ClipboardAndPrimarySelection' },
       { CopyMode = 'Close' }
    }
  }
)

config.key_tables = {
   copy_mode = copy_mode
}

return config
