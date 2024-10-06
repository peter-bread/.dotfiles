local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"

-- color_scheme = "rose-pine",
-- color_scheme = "tokyonight_night",
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.font = wezterm.font({
  family = "FiraCode Nerd Font",
  -- family = "JetBrainsMono Nerd Font",
  weight = "Book",
  harfbuzz_features = {
    -- "calt=0", -- disable ligatures
    "zero", -- 0 => zero with dot
    "ss05", -- @ => better [ AT ] symbol
    "ss03", -- & => better [ ampersand ] symbol
    -- "ss09", -- >>= <<= ||= |=
    -- "cv25", -- .-
    -- "cv26", -- :-
    -- "cv32", -- .=
    -- "cv27", -- []
    -- "cv28", -- {. .}
    -- "ss07", -- =~ !~
  },
})
-- TODO: add backup font
config.font_size = 18
config.send_composed_key_when_left_alt_is_pressed = false -- left opt is ALT/META key
config.send_composed_key_when_right_alt_is_pressed = true -- right opt is normal (so i can type #)

config.disable_default_key_bindings = true

config.keys = {
  {
    key = "=",
    mods = "SUPER",
    action = act.IncreaseFontSize,
  },
  {
    key = "-",
    mods = "SUPER",
    action = act.DecreaseFontSize,
  },
  {
    key = "0",
    mods = "SUPER",
    action = act.ResetFontSize,
  },
  {
    key = "|",
    mods = "SUPER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "SUPER|SHIFT",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "t",
    mods = "SUPER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "w",
    mods = "SUPER",
    action = act.CloseCurrentTab({ confirm = true }),
  },
  {
    key = "c",
    mods = "SUPER",
    action = act.CopyTo("Clipboard"),
  },
  {
    key = "v",
    mods = "SUPER",
    action = act.PasteFrom("Clipboard"),
  },
  {
    key = "]",
    mods = "SUPER",
    action = act.ActivateTabRelative(1),
  },
  {
    key = "[",
    mods = "SUPER",
    action = act.ActivateTabRelative(-1),
  },
}

-- launch maximised
wezterm.on("gui-startup", function(cmd)
  ---@diagnostic disable: unused-local
  -- selene: allow(unused_variable)
  -- local tab, pane, window = mux.spawn_window(cmd or {})
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
