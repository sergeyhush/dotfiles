vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    buftype_exclude = { "terminal" },
    filetype_exclude = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha" },
})

-- vim.cmd([[
-- function! Should_activate_indentblankline() abort
--   if index(g:indent_blankline_filetype_exclude, &filetype) == -1
--     IndentBlanklineEnable
--   endif
-- endfunction

-- augroup indent_blankline
--   autocmd!
--   autocmd InsertEnter * IndentBlanklineDisable
--   autocmd InsertLeave * call Should_activate_indentblankline()
-- augroup END
-- ]])
