local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup({
    defaults = {
        file_ignore_patterns = {".git/", "^node_modules/"}
    }
})
