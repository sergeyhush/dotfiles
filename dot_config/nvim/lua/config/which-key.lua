require("which-key").setup({})

local wk = require("which-key")
default_options = { noremap = true, silent = true }

wk.register({
    ["<Tab>"] = { "<cmd>e#<cr>", "Switch to previously opened buffer" },
    ["/"] = { "<cmd>Telescope live_grep<cr>", "Text" },
    b = {
        name = "Buffers",
        b = {
            "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
            "Find buffer",
        },
        a = {
            "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
            "Close all but the current buffer",
        },
        d = { "<cmd>Bdelete!<CR>", "Close Buffer" },
        f = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close all buffers to the left" },
        p = { "<cmd>BufferLineMovePrev<cr>", "Move buffer prev" },
        n = { "<cmd>BufferLineMoveNext<cr>", "Move buffer next" },
        r = {
            "<cmd>BufferLineCloseRight<cr>",
            "Close all BufferLines to the right",
        },
        x = {
            "<cmd>BufferLineSortByDirectory<cr>",
            "Sort BufferLines automatically by directory",
        },
        L = {
            "<cmd>BufferLineSortByExtension<cr>",
            "Sort BufferLines automatically by extension",
        },
    },
    f = {
        name = "Files",
        b = { "<cmd>Telescope file_browser<cr>", "File browser" },
f = {
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--hidden', '--type', 'file', '--follow'}})<cr>",
            "Find File",
        },
        l = { "<cmd>Lf<cr>", "Open LF" },
        p = { "<cmd>NvimTreeToggle<cr>", "Toogle Tree" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>w<cr>", "Save Buffer" },
        T = { "<cmd>NvimTreeFindFile<CR>", "Find in Tree" },
        z = { "<cmd>Telescope zoxide list<CR>", "Zoxide" },
    },
    g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        t = "Open Gitui", -- comand in toggleterm.lua
        n = { "<cmd>Neogit<cr>", "Open Neogit" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        g = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        B = { "<cmd>GitBlameToggle<cr>", "Toogle Blame" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)",
        },
    },
    l = {
        name = "LSP",
        A = {
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
            "Add Workspace Folder",
        },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
        I = {
            "<cmd>lua vim.lsp.buf.implementation()<cr>",
            "Show implementations",
        },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
        L = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "List Workspace Folders",
        },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        W = {
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
            "Remove Workspace Folder",
        },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
        e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    },
    s = {
        name = "Search",
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
H = { "<cmd>Telescope heading<cr>", "Find Header" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
        S = { "<cmd>Telescope symbols<cr>", "Search symbols" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
c = { "<cmd>Telescope commands<cr>", "Commands" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        P = {
    "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
"Colorscheme with Preview",
        },
    },
    w = {
        name = "Window",
        p = { "<c-w>x", "Swap" },
q = { "<cmd>:q<cr>", "Close" },
        s = { "<cmd>:split<cr>", "Horizontal Split" },
        t = { "<c-w>t", "Move to new tab" },
        ["="] = { "<c-w>=", "Equally size" },
        v = { "<cmd>:vsplit<cr>", "Verstical Split" },
        w = {
            "<cmd>lua require('nvim-window').pick()<cr>",
"Choose window to jump",
        },
    },
    z = {
        name = "Spelling",
        n = { "]s", "Next" },
p = { "[s", "Previous" },
a = { "zg", "Add word" },
        f = { "1z=", "Use 1. correction" },
l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
    },
}, { prefix = "<leader>", mode = "n", default_options })
