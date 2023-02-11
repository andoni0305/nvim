-- Automatically install lzay
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- require "user.plugins.keymaps"

-- Install your plugins here
return lazy.setup {
  -- General
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "moll/vim-bbye",
  "akinsho/toggleterm.nvim",
  "NvChad/nvim-colorizer.lua",
  --  "nvim-colortils/colortils.nvim"
  "windwp/nvim-spectre",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "markdown.mdx" }
    end,
    ft = { "markdown", "markdown.mdx" },
  },
  -- Delay repeat execution of certain keys
  "ja-ford/delaytrain.nvim",
  "samjwill/nvim-unception",

  -- Comment
  "numToStr/Comment.nvim",
  "folke/todo-comments.nvim",
  --  "B4mbus/todo-comments.nvim"

  -- UI
  "stevearc/dressing.nvim",
  "goolord/alpha-nvim",
  "folke/which-key.nvim",
  "rcarriga/nvim-notify",
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
  },
  "kyazdani42/nvim-web-devicons",
  --  "andymass/vim-matchup"
  "nvim-lualine/lualine.nvim",
  "kevinhwang91/nvim-bqf",
  { "Pocco81/true-zen.nvim", branch = "dev" },
  {
    "gen740/SmoothCursor.nvim",
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
  },
  -- install latest stable version (recommended)
  { "shortcuts/no-neck-pain.nvim", version = "*" },

  -- Registers
  --  "kkharji/sqlite.lua",
  --  {
  --   "AckslD/nvim-neoclip.lua",
  --   dependencies = {
  --     { "kkharji/sqlite.lua", module = "sqlite" },
  --     { "nvim-telescope/telescope.nvim" },
  --   },
  -- },

  -- Bookmarks
  --  "MattesGroeger/vim-bookmarks"
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Text navigation
  "ggandor/leap.nvim",
  "nacro90/numb.nvim",

  -- Word manipulation enhacements
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  "monaqa/dial.nvim",

  -- File navigation
  "kyazdani42/nvim-tree.lua",
  "tamago324/lir.nvim",

  -- Buffer management
  --  "akinsho/bufferline.nvim"
  --  {
  --   "noib3/nvim-cokeline",
  --   dependencies = "kyazdani42/nvim-web-devicons", -- If you want devicons
  -- }

  -- Colorschemes
  "folke/tokyonight.nvim",
  --  "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  --  "lunarvim/darkplus.nvim"
  "rose-pine/neovim",
  "rebelot/kanagawa.nvim",
  "andoni0305/mellow.nvim",
  "levouh/tint.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "projekt0n/github-nvim-theme",
  "savq/melange-nvim",
  "AlexvZyl/nordic.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",

  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-emoji",
  "hrsh7th/cmp-nvim-lua",
  "lukas-reineke/cmp-rg",
  --  'David-Kunz/cmp-npm' -- doesn't seem to work

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    build = "yarn install --frozen-lockfile && yarn compile",
  },

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "jayp0521/mason-null-ls.nvim",
  "jay-babu/mason-nvim-dap.nvim",
  "simrat39/symbols-outline.nvim",
  "ray-x/lsp_signature.nvim",
  "rmagatti/goto-preview",
  "b0o/SchemaStore.nvim",
  --  "folke/trouble.nvim",
  "RRethy/vim-illuminate",
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  -- "lvimuser/lsp-inlayhints.nvim",
  --  "simrat39/inlay-hints.nvim"
  -- "j-hui/fidget.nvim",

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
    end,
  },

  -- codeium
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },

  -- Lua
  "folke/lua-dev.nvim",

  -- Java
  --  "mfussenegger/nvim-jdtls"

  -- Telescope
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "mrjones2014/nvim-ts-rainbow",
  "nvim-treesitter/playground",
  "windwp/nvim-ts-autotag",

  -- Git
  "lewis6991/gitsigns.nvim",
  "https://github.com/rhysd/conflict-marker.vim",
  "almo7aya/openingh.nvim",
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- TMUX
  "christoomey/vim-tmux-navigator",

  -- File types
  "jxnblk/vim-mdx-js",

  -- JSON utils
  "gennaro-tedesco/nvim-jqx",

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- opt = true,
    -- event = "BufReadPre",
    -- module = { "dap" },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      { "jbyuki/one-small-step-for-vimkind" },
      "which-key.nvim",
    },
  },

  -- Testing
  {
    "klen/nvim-test",
    config = function()
      require("nvim-test").setup()
    end,
  },

  -- Note-taking
  "phaazon/mind.nvim",

  -- console log generator
  "PatschD/zippy.nvim",
}