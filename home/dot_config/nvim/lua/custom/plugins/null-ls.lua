local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
  b.code_actions.refactoring,
  b.code_actions.shellcheck,
  -- b.diagnostics.editorconfig_checker,
  b.diagnostics.golangci_lint,
  b.diagnostics.markdownlint,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  b.formatting.gofmt,
  b.formatting.goimports,
  b.formatting.shfmt,
  b.formatting.stylua,
  b.formatting.terraform_fmt,

}

null_ls.setup {
   debug = true,
   sources = sources,
}
