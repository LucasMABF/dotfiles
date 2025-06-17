require "nvchad.mappings"

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
unmap("n", "<leader>fo")
unmap("n", "<leader>fw")
unmap("n", "<leader>th")
unmap("n", "<leader>pt")
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap({ "n", "t" }, "<A-v>")
unmap({ "n", "t" }, "<A-h>")
unmap({ "n", "t" }, "<A-i>")
unmap("n", "<leader>ds")
unmap("n", "<leader>/")
unmap("n", "<leader>cm")

require("gitsigns").setup {
  on_attach = function(bufnr)
    map("n", "<leader>gd", package.loaded.gitsigns.reset_hunk, { buffer = bufnr, desc = "Discard Hunk change" })
    map("n", "<leader>gp", package.loaded.gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
    map("n", "<leader>gb", package.loaded.gitsigns.blame_line, { buffer = bufnr, desc = "Blame Line" })
    map("n", "<leader>gn", package.loaded.gitsigns.next_hunk, {buffer = bufnr, desc = "Jump to next Hunk"})
    map("n", "<leader>gN", package.loaded.gitsigns.prev_hunk, {buffer = bufnr, desc = "Jump to previous Hunk"})
  end,
}

-- custom mapings
local function grep_all()
  require("telescope.builtin").live_grep {
    additional_args = function()
      return { "--hidden", "--glob", "!.git/" }
    end,
  }
end
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fw", grep_all, { desc = "telescope live grep" })
vim.api.nvim_create_user_command("Themes", function()
  vim.cmd "Telescope themes"
end, {})

map("n", "<leader>t", function()
  require("nvchad.term").toggle { pos = "bo sp", id = "vtoggleTerm", size = 0.5 }
end, { desc = "Open terminal" })

map("t", "jk", "<C-\\><C-N>", { desc = "escape terminal mode" })

map("n", "<leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>l", "<C-w>l", { desc = "switch window right" })
map("n", "<leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<leader>k", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>s", "<cmd>w<CR>", { desc = "save file" })
map("n", "<leader>S", "<cmd>wa!<CR>", { desc = "save all files force" })
map("n", "U", "<C-r>", { desc = "redo" })
map("n", "<leader>zo", "<cmd>tabnew %<CR>", { desc = "zoom window" })
map("n", "<leader>zc", "<cmd>tabclose<CR>", { desc = "unzoom window" })
map("n", "<leader>y", '"+y', { desc = "yank to sistem clipboard" })
map("v", "<leader>y", '"+y', { desc = "yank to sistem clipboard" })
map("n", "<leader>p", '"+p', { desc = "paste from sistem clipboard" })
map("n", "<leader>P", '"+P', { desc = "paste from sistem clipboard" })
map("n", "<leader>q", "<cmd>qa<CR>", { desc = "quits all buffers" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "quits all buffers force" })
map("n", "<leader>w+", "<C-w>+", { desc = "increase height split" })
map("n", "<leader>w-", "<C-w>-", { desc = "decrease height split" })
map("n", "<leader>w>", "<C-w>>", { desc = "increase width split" })
map("n", "<leader>w<", "<C-w><", { desc = "decrease width split" })
map("n", "<C-d>", "<C-d>zz", { desc = "jumps half a page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "jumps half a page up" })
map("n", "<leader>Ld", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves selected text down" })
map("n", "J", "mzJ`z", { desc = "keeps cursor on same position on J" })
map("n", "<leader>d", '"_d', { desc = "deletes without saving to register" })
map("v", "<leader>d", '"_d', { desc = "deletes without saving to register" })
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replaces word on cursor" })
map("v", "<leader>r", [["0y:%s/<C-r>0/<C-r>0/gI<Left><Left><Left>]], { desc = "replaces selected text" })
map("n", "<leader>Lq", ":copen<CR>", { desc = "Open quick fix list" })

if vim.lsp.inlay_hint then
  map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { 0 })
  end, { desc = "Toggle inlay hints" })
end

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_format = "fallback", range = range }
end, { range = true })

map("n", "<leader>m", ":Format<CR>", { desc = "Format current file" })
map("v", "<leader>m", ":Format<CR>", { desc = "Format current selection" })

map("n", "<leader>o", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics." })

map("n", "<leader>G", function()
  vim.cmd "silent Copilot"
  vim.g.copilot_enabled = not vim.g.copilot_enabled
end, { desc = "Toggle GitHub Copilot suggestions" })

vim.g.copilot_no_tab_map = true
map("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Accept Copilot suggestion",
})

map("n", "<leader>C", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })

map("n", "<leader>I", function()
  local snacks = require "snacks"
  snacks.image.hover()
  map("n", "<Esc>", function()
    vim.cmd "noh"
    snacks.image.doc.hover_close()
    map("n", "<Esc>", "<cmd>noh<CR>", { buffer = 0, desc = "general clear highlights" })
  end, { buffer = 0, nowait = true, silent = true })
end, { desc = "Show image under cursor" })

