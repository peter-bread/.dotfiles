local M = {}

local wezterm = require("wezterm")
local act = wezterm.action

M.keys = {
  {
    key = "q",
    mods = "SUPER",
    action = act.QuitApplication,
  },
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
    mods = "SUPER|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "SUPER|SHIFT",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h",
    mods = "SUPER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "SUPER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "SUPER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "SUPER",
    action = act.ActivatePaneDirection("Right"),
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
  {
    key = "]",
    mods = "SUPER|SHIFT",
    action = act.MoveTabRelative(1),
  },
  {
    key = "[",
    mods = "SUPER|SHIFT",
    action = act.MoveTabRelative(-1),
  },
}

return M
