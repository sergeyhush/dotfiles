local M = {}

M.treesitter = {
  ensure_installed = {
    "hcl",
  },
}

M.mason = {
  ensure_installed = {
    "terraform-language-server",
  },
}

return M
