local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- source plugins.lua and run PackerSync on save
local sync_packer = function()
    vim.cmd("runtime lua/plugins.lua")
    require("packer").sync()
end
api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = sync_packer,
})
