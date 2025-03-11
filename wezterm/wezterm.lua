local wezterm = require("wezterm")
local keys = require("keys")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- Window ---------------------------------------------------------------------

config.window_decorations = "TITLE | RESIZE" -- this is the default value
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

-- launch maximised
wezterm.on("gui-startup", function(cmd)
  ---@diagnostic disable: unused-local
  -- selene: allow(unused_variable)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Tabs -----------------------------------------------------------------------

config.hide_tab_bar_if_only_one_tab = false

config.window_frame = {
  font = wezterm.font({
    family = "Fira Code",
    weight = "Bold",
  }),
  font_size = 13.0,
}

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, conf, hover, max_width)
    local background = "#1f1f29"
    local foreground = "#808080"

    if tab.is_active then
      background = "#c29c41"
      foreground = "#050505"
    end

    return {
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. tab.active_pane.title .. " " },
    }
  end
)

-- Colorscheme ----------------------------------------------------------------

config.color_scheme = "Kanagawa (Gogh)"

-- Font -----------------------------------------------------------------------

config.font_size = 18

config.font = wezterm.font({
  family = "Fira Code",
  weight = "Book",
  harfbuzz_features = {
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

-- Keys -----------------------------------------------------------------------

config.send_composed_key_when_left_alt_is_pressed = false -- left opt is ALT/META key
config.send_composed_key_when_right_alt_is_pressed = true -- right opt is normal (so I can type # on MacOS)

config.disable_default_key_bindings = true
config.keys = keys.keys

return config
