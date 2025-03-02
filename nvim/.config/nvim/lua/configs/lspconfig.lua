-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "ts_ls", "prismals", "eslint", "tailwindcss"} -- lua already setup and rust set up separetely
local nvlsp = require "nvchad.configs.lspconfig"

local unmap = vim.keymap.del
local map = vim.keymap.set
local unmap_lsp = function (client, bufnr)
  nvlsp.on_attach(client, bufnr)
  unmap('n', '<leader>ra', {buffer = bufnr})
  unmap('n', '<leader>sh', {buffer = bufnr})
  unmap('n', '<leader>D', {buffer = bufnr})
  unmap("n", "<leader>wa", {buffer = bufnr})
  unmap("n", "<leader>wl", {buffer = bufnr})
  unmap("n", "<leader>wr", {buffer = bufnr})
  unmap("n", "<leader>ca", {buffer = bufnr})
  map("n", "<leader>LD", vim.lsp.buf.type_definition, {buffer = bufnr, desc = "Go to Type Definition"})
  map("n", "<leader>Lca", vim.lsp.buf.code_action, {buffer = bufnr, desc = "LSP code actions"})
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = unmap_lsp,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
