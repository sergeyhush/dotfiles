require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "dockerls",
        "gopls",
        "marksman",
        "pyright",
        "yamlls",
    }
})
