require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local unmap = vim.keymap.del
-- remove mappings
unmap("n", "<C-h>")
unmap("n", "<C-l>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-s>")
unmap("n", "<leader>n")
unmap("n", "<leader>rn")
unmap("n", "<leader>ch")
unmap("n", "<leader>b")
unmap("n", "<C-n>")
unmap("n", "<leader>e")
unmap("n", "<leader>ma")
unmap("n", "<leader>th")
unmap("n", "<leader>pt")
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap({"n", "t"}, "<A-v>")
unmap({"n", "t"}, "<A-h>")
unmap({"n", "t"}, "<A-i>")
unmap("n", "<leader>ds")
unmap("n", "<leader>/")
unmap("n", "<leader>cm")


require("gitsigns").setup{
  on_attach = function(bufnr)
    map('n', '<leader>gd', package.loaded.gitsigns.reset_hunk, {buffer = bufnr, desc = "Discard Hunk change"})
    map('n', '<leader>gp', package.loaded.gitsigns.preview_hunk, {buffer = bufnr, desc = "Preview Hunk"})
    map('n', '<leader>gb', package.loaded.gitsigns.blame_line, {buffer = bufnr, desc = "Blame Line"})
  end
}


-- custom mapings
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
vim.api.nvim_create_user_command("Themes", function()
  vim.cmd("Telescope themes")
end, {})


map("n", "<leader>t", function()
  require("nvchad.term").toggle { pos = "sp", id = "vtoggleTerm", size = 0.5}
end, { desc = "terminal new horizontal term" })

map("t", "jk", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>l", "<C-w>l", { desc = "switch window right" })
map("n", "<leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<leader>k", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>s", "<cmd>w<CR>", { desc = "save file" })
map("n", "<leader>S", "<cmd>wa!<CR>", { desc = "save all files force"})
map("n", "U", "<C-r>", {desc = "redo"})
map("n", "<leader>zo", "<cmd>tabnew %<CR>", {desc = "zoom window"})
map("n", "<leader>zc", "<cmd>tabclose<CR>", {desc = "unzoom window"})
map("n", "<leader>y", '"+y', {desc = "yank to sistem clipboard"})
map("v", "<leader>y", '"+y', {desc = "yank to sistem clipboard"})
map("n", "<leader>p", '"+p', {desc = "paste from sistem clipboard"})
map("n", "<leader>P", '"+P', {desc = "paste from sistem clipboard"})
map("n", "<leader>q", '<cmd>qa<CR>', {desc = "quits all buffers"})
map("n", "<leader>Q", '<cmd>qa!<CR>', {desc = "quits all buffers force"})
map("n", "<leader>w+", '<C-w>+', {desc = "increase height split"})
map("n", "<leader>w-", '<C-w>-', {desc = "decrease height split"})
map("n", "<leader>w>", '<C-w>>', {desc = "increase width split"})
map("n", "<leader>w<", '<C-w><', {desc = "decrease width split"})
map("n", "<C-d>", '<C-d>zz', {desc = "jumps half a page down"})
map("n", "<C-u>", '<C-u>zz', {desc = "jumps half a page up"})
map("n", "<leader>Ld", vim.diagnostic.setloclist, {desc = "LSP Diagnostic loclist"})
map("n", "<leader>nrl", "<cmd>!npm run lint<CR>", {desc = "lints with eslint"});

map("v", "J", ":m '>+1<CR>gv=gv", {desc = "moves selected text down"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "moves selected text down"})
map("n", "J", "mzJ`z", {desc = "keeps cursor on same position on J"})
map("n", "<leader>d", '"_d', {desc = "deletes without saving to register"})
map("v", "<leader>d", '"_d', {desc = "deletes without saving to register"})
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "replaces word on cursor"})
map("v", "<leader>r", [["0y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>]], {desc = "replaces selected text"})
