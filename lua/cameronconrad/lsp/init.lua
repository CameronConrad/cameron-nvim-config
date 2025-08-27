local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

lspconfig.ts_ls.setup({
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
