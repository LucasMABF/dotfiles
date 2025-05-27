-- load defaults i.e lua_lsp
dofile(vim.g.base46_cache .. "lsp")

local map = vim.keymap.set
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    map("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Go to declaration" })
    map("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
    map("n", "<leader>LD", vim.lsp.buf.type_definition, { buffer = args.buf, desc = "Go to Type Definition" })
    map("n", "<leader>Lca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "LSP code actions" })
  end,
})

local lua_lsp_settings = {
  Lua = {
    workspace = {
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
      },
    },
  },
}

local nvlsp = require "nvchad.configs.lspconfig"
vim.lsp.config("*", { capabilities = nvlsp.capabilities, on_init = nvlsp.on_init })
vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
vim.lsp.enable "lua_ls"

local servers = { "html", "cssls", "ts_ls", "prismals", "eslint", "tailwindcss" } -- lua already setup and rust set up separetely

vim.lsp.enable(servers)

-- clangd separately because of performance difference ???

local lspconfig = require "lspconfig"
lspconfig.clangd.setup {
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}


local x = vim.diagnostic.severity
vim.diagnostic.config {
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  virtual_lines = {
    format = function(diagnostic)
      return string.format(" %s", diagnostic.message)
    end,
  },
  virtual_text = false,
  underline = true,
  float = { border = "single" },
  update_in_insert = true,
}
