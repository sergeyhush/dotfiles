return { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            bash = { "shfmt", "shellcheck" },
            javascript = { { "prettierd", "prettier" } },
            json = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt" },
            sh = { "shfmt", "shellcheck" },
            zsh = { "shfmt", "shellcheck" },
        },
    },
}
