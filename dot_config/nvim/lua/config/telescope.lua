local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup({
    file_ignore_patterns = {".git/"}
})
