local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  max_jobs = 10,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin management
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim"

  -- General
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "moll/vim-bbye"
  use "numToStr/Comment.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  -- use "norcalli/nvim-colorizer.lua"
  use "NvChad/nvim-colorizer.lua"
  use "windwp/nvim-spectre"
  use "folke/todo-comments.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- UI
  use "stevearc/dressing.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  use "rcarriga/nvim-notify"
  use "tversteeg/registers.nvim"
  -- use "SmiteshP/nvim-gps"
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }
  use "kyazdani42/nvim-web-devicons"
  use "andymass/vim-matchup"
  use "nvim-lualine/lualine.nvim"
  use "kevinhwang91/nvim-bqf"

  -- Bookmarks
  -- use "MattesGroeger/vim-bookmarks"
  use "ThePrimeagen/harpoon"

  -- Buffer/Text navigation
  use "ggandor/lightspeed.nvim"
  use "nacro90/numb.nvim"

  -- Word manipulation enhacements
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-abolish"
  use "monaqa/dial.nvim"

  -- File navigation
  use "kyazdani42/nvim-tree.lua"
  use "tamago324/lir.nvim"

  -- Buffer management
  use {
    "ghillb/cybu.nvim",
    requires = { "kyazdani42/nvim-web-devicons" }, --optional
  }
  use "akinsho/bufferline.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"

  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "lukas-reineke/cmp-rg"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use {
    "dsznajder/vscode-es7-javascript-react-snippets",
    run = "yarn install --frozen-lockfile && yarn compile",
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "rmagatti/goto-preview"
  use "b0o/SchemaStore.nvim"
  use "folke/trouble.nvim"
  use "RRethy/vim-illuminate"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  -- use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "f-person/git-blame.nvim"
  use "https://github.com/rhysd/conflict-marker.vim"

  -- TMUX
  use "christoomey/vim-tmux-navigator"

  -- File types
  use "jxnblk/vim-mdx-js"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
