require "nvchad.options"

vim.opt.clipboard = ""
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.scrolloff = 10
vim.o.wrap = false
vim.o.sidescrolloff = 10


local os = vim.loop.os_uname().sysname

if os == "Windows_NT" then
  vim.o.shell = "powershell"
  vim.o.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  vim.o.shellxquote = ''
elseif os == "Linux" then
  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    callback = function()
      local shell = vim.fn.expand('$SHELL')
      if shell:match('bash') then
          vim.fn.chansend(vim.b.terminal_job_id, 'set -o vi\nclear\n')
      end
    end,
  })
end

