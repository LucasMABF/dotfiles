local M = {}

M.my_on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, opts "Open: no window picker")
  vim.keymap.del("n", "<C-k>", opts "")
  vim.keymap.set("n", "<leader>t", function()
    api.tree.toggle()
    require("nvchad.term").toggle { pos = "bo sp", id = "vtoggleTerm", size = 0.5 }
    api.tree.toggle { focus = false }
  end, opts "Open terminal")
end

return M
