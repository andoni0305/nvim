local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local icons = require "user.icons"

notify.setup {
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Render function for notifications. See notify-render()
  render = "minimal",

  -- Default timeout for notifications
  timeout = 175,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  -- background_colour = "#161617",

  -- Minimum width for notification windows
  minimum_width = 10,

  -- Icons for the different levels
  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },
}

local banned_messages = { "No information available" }

vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  notify(msg, ...)
end
