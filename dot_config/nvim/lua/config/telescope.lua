local telescope = require 'telescope'
local actions = require 'telescope.actions'
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", ".terraform", "%.jpg", "%.png" },
        -- used for grep_string and live_grep
        vimgrep_arguments = {
            "rg",
            "--follow",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--no-ignore",
            "--trim",
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
        file_browser = {
            mappings = {
                i = {
                    ["<c-n>"] = fb_actions.create,
                    ["<c-r>"] = fb_actions.rename,
                    -- ["<c-h>"] = actions.which_key,
                    ["<c-h>"] = fb_actions.toggle_hidden,
                    ["<c-x>"] = fb_actions.remove,
                    ["<c-p>"] = fb_actions.move,
                    ["<c-y>"] = fb_actions.copy,
                    ["<c-a>"] = fb_actions.select_all,
                },
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("packer")
telescope.load_extension("ui-select")
telescope.load_extension("heading")
