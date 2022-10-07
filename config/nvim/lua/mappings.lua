vim.g.mapleader = " "

local map = vim.keymap.set

map("", "<A-1>", ":Neotree toggle<CR>")
map("", "<A-3>", ":NeoTreeReveal<CR>")
map("", "<A-!>", ":Commits<CR>")

map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })
map("n", "ga", "<Plug>(coc-codeaction)", { silent = true })
map("n", "gn", "<Plug>(coc-rename)", { silent = true })
map("n", "ge", "<Plug>(coc-diagnostic-next)", { silent = true })
map("n", "gp", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "<leader>ev", ":vsp $MYVIMRC<CR>", { silent = true })
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true })

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
map("n", "<leader>ff", "<cmd>lua require 'telescope.builtin'.live_grep()<CR>")
