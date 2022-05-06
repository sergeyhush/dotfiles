require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "python", "go", "lua" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
