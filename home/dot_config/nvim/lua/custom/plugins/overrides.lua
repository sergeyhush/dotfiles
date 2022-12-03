local M = {}

M.treesitter = {
  ensure_installed = {
    "go",
    "gomod",
    "hcl",
    "markdown",
  },
}

M.mason = {
  ensure_installed = {
    "goimports",
    "gopls",
    "terraform-ls",
    "lua-language-server",
  },
}

return M
