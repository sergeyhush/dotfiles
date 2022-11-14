local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    execute("packadd packer.nvim")
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

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

use {'wbthomason/packer.nvim'}

-- LSP
use {'VonHeikemen/lsp-zero.nvim',
    config = [[require('config.lsp-zero')]],
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
}
use {'williamboman/mason.nvim', config = [[require('config.mason')]]}
use {'williamboman/mason-lspconfig.nvim', config = [[require('config.mason-lspconfig')]]}
-- use {'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }
-- use {'neovim/nvim-lspconfig'}
use {'onsails/lspkind-nvim'}
use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}

-- Autocomplete
use {'L3MON4D3/LuaSnip'}
-- use {'quangnguyen30192/cmp-nvim-ultisnips'}
use {'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    config = [[require('config.nvim-cmp')]]
}
-- use {'rafamadriz/friendly-snippets'}
use {'andymass/vim-matchup'}
-- TODO: try
-- use {'JoosepAlviste/nvim-ts-context-commentstring'}
-- use { 'lewis6991/nvim-treesitter-context' }

-- Treesitter
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.nvim-treesitter')]]}
use {'nvim-treesitter/nvim-treesitter-textobjects'}

-- Syntax
use {'junegunn/vim-easy-align'}
use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
-- use {'tpope/vim-commentary', event=VimEnter}
-- TODO: try
-- use { 'mhartington/formatter.nvim', config = lua_path"formatter" }

-- Telescope
use {'nvim-lua/plenary.nvim' }
use {'nvim-telescope/telescope.nvim', config = [[require('config.telescope')]]}
use({ "crispgm/telescope-heading.nvim" })
use({ "nvim-telescope/telescope-symbols.nvim" })
use({ "nvim-telescope/telescope-file-browser.nvim" })
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use({ "nvim-telescope/telescope-packer.nvim" })
use({ "nvim-telescope/telescope-ui-select.nvim" })
use {
  'pwntester/octo.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup()
  end
}


use "mhinz/vim-startify"
use {"akinsho/nvim-toggleterm.lua", config= [[require('config.nvim-toggleterm')]] }

use {'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim', config = [[require('config.null-ls')]]}
use {'gpanders/editorconfig.nvim'}
use {'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = [[require('config.trouble')]]}
-- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
use {'williamboman/nvim-lsp-installer', after = "nvim-lspconfig", config = [[require('config.lsp-installer')]] }


use {'TimUntersberger/neogit',
  requires = { "nvim-lua/plenary.nvim" }, cmd = "Neogit", config = [[require('config.neogit')]],
}

-- use "f-person/git-blame.nvim"
use {'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

use {'max397574/better-escape.nvim', config = [[require('config.better-escape')]]}
use {'tpope/vim-vinegar', event=VimEnter}
use {'tpope/vim-surround'}

-- Statusline
use {'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = 'VimEnter', config = [[require('config.statusline')]],
}
-- Automatic insertion and deletion of a pair of characters
use {'Raimondi/delimitMate', event = 'InsertEnter'}
-- Show match number and index for searching
use {'kevinhwang91/nvim-hlslens', config = [[require('config.hlslens')]]}

use { 'lukas-reineke/indent-blankline.nvim',
  event = 'VimEnter', config = [[require('config.indent-blankline')]]
}

use {'editorconfig/editorconfig-vim'}
use {'dracula/vim', as='dracula'}
use {'lifepillar/vim-gruvbox8', opt = true}

use {'ray-x/go.nvim', requires = "ray-x/guihua.lua", config =[[require('config.go')]]}
use {'tweekmonster/startuptime.vim'}
use {'RRethy/vim-illuminate', config = [[require('illuminate')]]}
use {'folke/zen-mode.nvim', config = [[require('config.zen-mode')]]}
use {'folke/which-key.nvim', config = [[require('config.which-key')]]}
use {'wellle/targets.vim'}
use {'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    }
}
