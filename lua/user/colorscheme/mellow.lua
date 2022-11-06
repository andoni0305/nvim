local status_ok, mellow = pcall(require, "mellow")
if not status_ok then
  return
end

local colors = require("mellow.colors").dark

-- vim.g.mellow_italic_functions = true
-- vim.g.mellow_bold_functions = true
-- vim.g.mellow_bold_variables = true
-- vim.g.mellow_bold_keywords = true

local colorscheme = "mellow"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- NOTE: color highlight overrides
vim.api.nvim_set_hl(0, "Function", { fg = colors.bright_blue, italic = true })
vim.api.nvim_set_hl(0, "Keyword", {
  fg = colors.blue,
  bold = true,
})
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.white, bg = colors.bg })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.bg_dark, bg = colors.bg })
-- vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = colors.white, bg = colors.bg })
-- vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = colors.gray05 })
vim.api.nvim_set_hl(0, "Winbar", { fg = colors.white, bg = nil })
-- vim.api.nvim_set_hl(0, "WinbarNC", { bg = nil })