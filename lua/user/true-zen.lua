local status_ok, zen = pcall(require, "true-zen")
if not status_ok then
  return
end

local lualine_ok, lualine = pcall(require, "lualine")

local api = vim.api

local opts = { noremap = true, silent = true, nowait = true }

-- TODO: fix issues when applying modes on top of each other (e.g. ataraxis when in minimalist)
-- api.nvim_set_keymap("n", "<leader>n", ":TZNarrow<CR>", opts)
api.nvim_set_keymap("v", "<leader>n", ":'<,'>TZNarrow<CR>", opts)
api.nvim_set_keymap("n", "<leader>nn", ":TZFocus<CR>", opts)
api.nvim_set_keymap("n", "<leader>nm", ":TZMinimalist<CR>", opts)
api.nvim_set_keymap("n", "<leader>nz", ":TZAtaraxis<CR>", opts)

local function tmux_off()
  if vim.fn.exists "$TMUX" == 0 then
    return
  end
  vim.cmd [[silent !tmux set status off]]
end

local function tmux_on()
  if vim.fn.exists "$TMUX" == 0 then
    return
  end
  vim.cmd [[silent !tmux set status on]]
end

local function open_cb()
  if lualine_ok then
    lualine.hide()
  end
  tmux_off()
end

local function close_cb()
  if lualine_ok then
    lualine.hide { unhide = true }
  end
  tmux_on()
end

zen.setup {
  modes = {
    ataraxis = {
      shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
      backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
      minimum_writing_area = { -- minimum size of main window
        width = 70,
        height = 44,
      },
      quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
      padding = { -- padding windows
        left = 30,
        right = 30,
        top = 0,
        bottom = 0,
      },
      open_callback = open_cb,
      close_callback = close_cb,
    },
    minimalist = {
      options = { -- options to be disabled when entering Minimalist mode
        number = false,
        relativenumber = false,
        showtabline = 0,
        signcolumn = "yes",
        -- statusline = "",
        cmdheight = 1,
        -- laststatus = 0,
        showcmd = true,
        showmode = false,
        ruler = false,
        numberwidth = 1,
      },
      open_callback = open_cb,
      close_callback = close_cb,
    },
  },
  integrations = {
    tmux = true,
    kitty = {
      enabled = true,
      font = "+1",
    },
  },
  -- your config goes here
  -- or just leave it empty :)
}