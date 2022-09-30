vim.g.mapleader = " "

local map = vim.keymap.set

map("", "<A-1>", ":Neotree toggle<CR>")
map("", "<A-3>", ":NeoTreeReveal<CR>")
map("", "<A-!>", ":Commits<CR>")

map("n", "<silent> gd", "<Plug>(coc-definition)", { remap = true })
map("n", "<silent> gy", "<Plug>(coc-type-definition)", { remap = true })
map("n", "<silent> gi", "<Plug>(coc-implementation)", { remap = true })
map("n", "<silent> gr", "<Plug>(coc-references)", { remap = true })
map("n", "<silent> ga", "<Plug>(coc-codeaction)", { remap = true })
map("n", "<silent> gn", "<Plug>(coc-rename)", { remap = true })
map("n", "<silent> ge", "<Plug>(coc-diagnostic-next)", { remap = true })
map("n", "<silent> gp", "<Plug>(coc-diagnostic-prev)", { remap = true })
map("n", "<leader>ev", ":vsp $MYVIMRC<CR>", { remap = true })
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { remap = true })

map("n", "<leader>t", ":vsp term://fish<CR>")
map("t", "<Esc>", "<C-\\><C-n><CR>")

vim.api.nvim_create_autocmd("TermOpen", {
  nested = true,
  callback = function()
    vim.cmd('startinsert')
  end,
})

map("n", "<A-q>", "<cmd>lua require 'telescope.builtin'.find_files()<CR>")
map("n", "<A-w>", "<cmd>lua require 'telescope.builtin'.git_files()<CR>")
map("n", "<leader> ff", "<cmd>lua require 'telescope.builtin'.live_grep()<CR>")
