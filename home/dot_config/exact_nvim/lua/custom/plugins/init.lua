local overrides = require "custom.plugins.overrides"

return {
  ["goolord/alpha-nvim"] = {disable = false}, -- enables dashboard

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
}
