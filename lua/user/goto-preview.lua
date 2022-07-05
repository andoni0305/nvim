local status_ok, gpreview = pcall(require, "goto-preview")
if not status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true, silent = true, nowait = true }

keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", keymap_opts)
keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", keymap_opts)
keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", keymap_opts)
-- requires telescope
keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", keymap_opts)

gpreview.setup {
  width = 120, -- Width of the floating window
  height = 20, -- Height of the floating window
  border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
  default_mappings = false, -- Bind default mappings
  debug = false, -- Print debug information
  opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
  post_open_hook = function(buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "q", ":q<CR>", { noremap = true })
    -- vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>o", ":e %<CR>", { noremap = true })
    -- TODO: find how to open buffer of preview in current window
    -- keymap("n", "<leader>o", ":e %<CR>", { noremap = true })
  end, -- A function taking two arguments, a buffer and a window to be ran as a hook.
  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  focus_on_open = true, -- Focus the floating window when opening it.
  dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
}
