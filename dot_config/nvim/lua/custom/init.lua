local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufRead","BufNewFile"}, {
  pattern = "*.hcl",
  command="set filetype=hcl",
})
autocmd({"BufRead","BufNewFile"}, {
  pattern = {".terraformrc", "terraform.rc"},
  command="set filetype=hcl",
})
autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.tf", "*.tfvars"},
  command="set filetype=terraform",
})

autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.tfstate", "*.tfstate.backup"},
  command="set filetype=json",
})
