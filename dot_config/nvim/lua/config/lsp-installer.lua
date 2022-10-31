local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
    "bashls",
    "pyright",
    "yamlls",
    "gopls",
    "marksman",
}

lsp_installer.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- for _, name in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found and not server:is_installed() then
--     print("Installing " .. name)
--     server:install()
--   end
-- end


-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     server:setup(opts)
-- end)
