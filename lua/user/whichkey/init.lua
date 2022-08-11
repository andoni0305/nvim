local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local wk_settings = require "user.whichkey.settings"

local mappings = {
  w = { "<cmd>w<CR>", "Write" },
  h = { "<cmd>nohlsearch<CR>", "No HL" },
  q = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
  zz = { '<cmd>lua require("user.functions").save_and_exit()<CR>', "Save and exit" },
  ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
  c = { "<cmd>Bdelete!<CR>", "Close Buffer" },

  o = {
    name = "Options",
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
  },

  ["-"] = { "<cmd>split<cr>", "HSplit" },
  ["|"] = { "<cmd>vsplit<cr>", "VSplit" },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  },

  l = {
    name = "LSP",
    c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
    f = {
      "<cmd>lua require('user.lsp.handlers').null_ls_format()<cr>",
      "Format",
    },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      "Prev Diagnostic",
    },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
    v = { '<cmd>lua require("lsp_lines").toggle()<cr>', "Toggle virtual text" },
    h = { '<cmd>lua require("lsp-inlayhints").toggle()<cr>', "Toggle hints" },
  },

  N = {
    ":e ~/Notes/<cr>",
    "Notebook",
  },
}

local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(wk_settings.setup)
which_key.register(mappings, wk_settings.opts)
which_key.register(vmappings, wk_settings.vopts)
