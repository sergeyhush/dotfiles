local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
    -- sources = {
    --     nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    --     nls.builtins.diagnostics.eslint,
    --     nls.builtins.formatting.prettier.with({
    --         extra_args = { "--single-quote", "false" },
    --     }),
    --     nls.builtins.formatting.terraform_fmt,
    --     nls.builtins.formatting.black,
    --     nls.builtins.formatting.goimports,
    --     nls.builtins.formatting.gofumpt,
    --     nls.builtins.code_actions.shellcheck,
    -- },
    -- on_attach = nil,
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
    --                     vim.lsp.buf.format({ bufnr = bufnr })
    --                 end
    --             end,
    --         })
    --     end
    --     require("functions").custom_lsp_attach(client, bufnr)
    -- end,
})
