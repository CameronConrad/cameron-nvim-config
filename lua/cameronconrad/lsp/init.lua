local nmap = require("cameronconrad.keymap").nmap

local has_lsp, _ = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local custom_attach = function(client)
  local active_clients = vim.lsp.get_active_clients()
  local buffer_number = vim.api.nvim_get_current_buf()
  if client.name == "denols" then
    for _, client_ in pairs(active_clients) do
      -- stop tsserver if denols is already active
      if client_.name == "tsserver" then
        client_.stop()
      end
    end
  elseif client.name == "tsserver" then
    for _, client_ in pairs(active_clients) do
      -- prevent tsserver from starting if denols is already active
      if client_.name == "denols" then
        client.stop()
      end
    end
  end

--NOTE: This is adding floating window help for functions while typing
require "lsp_signature".on_attach({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}, buffer_number)

  --Older native lsp configuration options
  buf_nnoremap { "K", vim.lsp.buf.hover }
  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "<leader>gn", vim.diagnostic.goto_next }
  buf_nnoremap { "<leader>gp", vim.diagnostic.goto_prev }
  buf_nnoremap { "<leader>gr", vim.lsp.buf.rename }
  buf_nnoremap { "<leader>gR", vim.lsp.buf.references}
  buf_nnoremap { "gt", vim.lsp.buf.type_definition }
  buf_nnoremap { "gi", vim.lsp.buf.implementation }
  buf_nnoremap { "<leader>gl", "<cmd>Telescope diagnostics<cr>"}
  buf_nnoremap { "<leader>ca", vim.lsp.buf.code_action }
end

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,

}

require('lspconfig').setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim"}
      }
    }
  }
}
