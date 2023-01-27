local ok, no_neck_pain = pcall(require, "no-neck-pain")
if not ok then
  vim.notify "no-neck-pain load issue"
  return
end

no_neck_pain.setup {
  -- Prints useful logs about what event are triggered, and reasons actions are executed.
  debug = false,
  -- When `true`, enables the plugin when you start Neovim.
  enableOnVimEnter = false,
  -- The width of the focused buffer when enabling NNP.
  -- If the available window size is less than `width`, the buffer will take the whole screen.
  width = 130,
  -- Set globally to Neovim, it allows you to toggle the enable/disable state.
  -- When `false`, the mapping is not created.
  toggleMapping = "<Leader>np",
  -- Disables NNP if the last valid buffer in the list has been closed.
  disableOnLastBuffer = false,
  -- When `true`, disabling NNP kills every split/vsplit buffers except the main NNP buffer.
  killAllBuffersOnDisable = false,
  --- Common options that are set to both buffers, for option scoped to the `left` and/or `right` buffer, see `buffers.left` and `buffers.right`.
  --- See |NoNeckPain.bufferOptions|.
  buffers = {
    -- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
    setNames = false,
    -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
    -- See |NoNeckPain.bufferOptions| for more details.
    backgroundColor = nil,
    -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
    blend = 0,
    -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
    textColor = nil,
    -- Vim buffer-scoped options: any `vim.bo` options is accepted here.
    bo = {
      filetype = "no-neck-pain",
      buftype = "nofile",
      bufhidden = "hide",
      buflisted = false,
      swapfile = false,
    },
    -- Vim window-scoped options: any `vim.wo` options is accepted here.
    wo = {
      cursorline = false,
      cursorcolumn = false,
      number = false,
      relativenumber = false,
      foldenable = false,
      list = false,
      wrap = true,
      linebreak = true,
    },
    --- Options applied to the `left` buffer, the options defined here overrides the ones at the root of the `buffers` level.
    --- See |NoNeckPain.bufferOptions|.
    left = NoNeckPain.bufferOptions,
    --- Options applied to the `right` buffer, the options defined here overrides the ones at the root of the `buffers` level.
    --- See |NoNeckPain.bufferOptions|.
    right = NoNeckPain.bufferOptions,
  },
  -- Supported integrations that might clash with `no-neck-pain.nvim`'s behavior.
  integrations = {
    -- https://github.com/nvim-tree/nvim-tree.lua
    NvimTree = {
      -- the position of the tree, can be `left` or `right``
      position = "left",
    },
    -- https://github.com/mbbill/undotree
    undotree = {
      -- the position of the tree, can be `left` or `right``
      position = "left",
    },
  },
}

NoNeckPain.bufferOptions = {
  -- When `false`, the buffer won't be created.
  enabled = true,
  -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
  -- See |NoNeckPain.bufferOptions| for more details.
  backgroundColor = nil,
  -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
  blend = 0,
  -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
  textColor = nil,
  -- Vim buffer-scoped options: any `vim.bo` options is accepted here.
  bo = {
    filetype = "no-neck-pain",
    buftype = "nofile",
    bufhidden = "hide",
    buflisted = false,
    swapfile = false,
  },
  -- Vim window-scoped options: any `vim.wo` options is accepted here.
  wo = {
    cursorline = false,
    cursorcolumn = false,
    number = false,
    relativenumber = false,
    foldenable = false,
    list = false,
    wrap = true,
    linebreak = true,
  },
}

-- NOTE: autocomand for activating on init
vim.api.nvim_create_augroup("OnVimEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = "OnVimEnter",
  pattern = "*",
  callback = function()
    vim.schedule(function()
      require("no-neck-pain").enable()
    end)
  end,
})

require "user.no-neck-pain.keymaps"
