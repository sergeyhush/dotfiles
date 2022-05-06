local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")
packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})
local use = packer.use
packer.reset()

-- use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

use "wbthomason/packer.nvim"

use {
  "nvim-telescope/telescope.nvim",
  requires = {{ "nvim-lua/plenary.nvim" } }, config = [[require('config.telescope')]],
}

-- config for built-in LSP client
use {"neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] }

use "jose-elias-alvarez/null-ls.nvim"

-- auto-completion engine
use {"hrsh7th/nvim-cmp", config = [[require('config.nvim-cmp')]]}
-- nvim-cmp completion sources
use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
use {"hrsh7th/cmp-path", after = "nvim-cmp"}
use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}

use 'folke/trouble.nvim'
-- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
use {'williamboman/nvim-lsp-installer', after = "nvim-lspconfig", config = [[require('config.lsp-installer')]] }


use {
  "TimUntersberger/neogit",
  requires = { "nvim-lua/plenary.nvim" }, cmd = "Neogit", config = [[require('config.neogit')]],
}

use {
  "max397574/better-escape.nvim",
  config = function() require("better_escape").setup() end
}

use {"tpope/vim-commentary", event=VimEnter}
use {"tpope/vim-vinegar", event=VimEnter}

-- Statusline
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = 'VimEnter', config = [[require('config.statusline')]],
}
-- Automatic insertion and deletion of a pair of characters
use({"Raimondi/delimitMate", event = "InsertEnter"})
-- Show match number and index for searching
use {'kevinhwang91/nvim-hlslens', config = [[require('config.hlslens')]]}

use({
  "lukas-reineke/indent-blankline.nvim",
  event = 'VimEnter', config = [[require('config.indent-blankline')]]
})

use 'editorconfig/editorconfig-vim'


use {'dracula/vim', as='dracula'}
use {"lifepillar/vim-gruvbox8", opt = true}

use {'nvim-treesitter/nvim-treesitter', config = [[require('config.nvim-treesitter')]]}

use {'folke/which-key.nvim', config = [[require('config.which-key')]]}

