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
    max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
    -- Have packer use a popup window
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})
local use = packer.use
packer.reset()

-- use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

use "wbthomason/packer.nvim"

use {
    "nvim-telescope/telescope.nvim",
    requires = {{ "nvim-lua/plenary.nvim" }, { "nvim-lua/plenary.nvim"}},
    config = [[require('config.telescope')]]
}

use({ "crispgm/telescope-heading.nvim" })
use({ "nvim-telescope/telescope-symbols.nvim" })
use({ "nvim-telescope/telescope-file-browser.nvim" })
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use({ "nvim-telescope/telescope-packer.nvim" })
use({ "nvim-telescope/telescope-ui-select.nvim" })

use {'nvim-treesitter/nvim-treesitter', config = [[require('config.nvim-treesitter')]]}

use "mhinz/vim-startify"
use {"akinsho/nvim-toggleterm.lua",
    config= [[require('config.nvim-toggleterm')]]
}

use {"neovim/nvim-lspconfig", config = [[require('config.lsp')]] }

use {"jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim", config = [[require('config.null-ls')]]}
use "gpanders/editorconfig.nvim"

use {"hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- "f3fora/cmp-spell",
    },
    config = [[require('config.nvim-cmp')]]
}

use {'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = [[require('config.trouble')]]}
-- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
use {'williamboman/nvim-lsp-installer', after = "nvim-lspconfig", config = [[require('config.lsp-installer')]] }


use {
  "TimUntersberger/neogit",
  requires = { "nvim-lua/plenary.nvim" }, cmd = "Neogit", config = [[require('config.neogit')]],
}

use "f-person/git-blame.nvim"

use {
  "max397574/better-escape.nvim",
  config = function() require("better_escape").setup() end
}

use {"tpope/vim-commentary", event=VimEnter}
use {"tpope/vim-vinegar", event=VimEnter}
use "tpope/vim-surround"

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


use {'folke/which-key.nvim', config = [[require('config.which-key')]]}

use 'junegunn/vim-easy-align'

use {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup()
  end
}

use {'ray-x/go.nvim', requires = "ray-x/guihua.lua", config =[[require('config.go')]]}
use({ "tweekmonster/startuptime.vim" })

use({ "RRethy/vim-illuminate", config = [[require('illuminate')]] })


