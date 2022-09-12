local status_ok, zen = pcall(require, "true-zen")
if not status_ok then
  return
end

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

local callbacks = {
  open_pre = tmux_off,
  close_pre = tmux_on,
}

zen.setup {
  modes = {
    ataraxis = {
      shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
      backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
      -- minimum_writing_area = { -- minimum size of main window
      --   width = 70,
      --   height = 44,
      -- },
      quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
      -- padding = { -- padding windows
      --   left = 30,
      --   right = 30,
      --   top = 0,
      --   bottom = 0,
      -- },
      callbacks = callbacks,
    },
    minimalist = {
      options = { -- options to be disabled when entering Minimalist mode
        number = true,
        relativenumber = true,
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
      callbacks = callbacks,
    },
  },
  integrations = {
    tmux = false,
    kitty = {
      enabled = false,
      font = "+0",
    },
    lualine = true,
  },
  -- your config goes here
  -- or just leave it empty :)
}

require "user.true-zen.keymaps"
