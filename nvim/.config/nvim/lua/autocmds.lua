require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.bo[0].buflisted = true
    vim.schedule(function()
      local bufnr = vim.api.nvim_get_current_buf()
      if vim.fn.winnr "$" > 1 then
        vim.api.nvim_command "silent noautocmd keepalt helpclose"
      end
      vim.schedule(function()
        require("nvchad.tabufline").goto_buf(bufnr)
      end)
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<leader>x", ":q<CR>", { buffer = 0, desc = "Close Diagnostic Loclist" })
  end,
})
