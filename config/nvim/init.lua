-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add = MiniDeps.add

add({ source = "https://github.com/nvim-treesitter/nvim-treesitter" })
add({ source = "https://github.com/neovim/nvim-lspconfig" })
add({ source = "https://github.com/mason-org/mason.nvim" })
add({ source = "https://github.com/dasupradyumna/midnight.nvim" })

require "mason".setup()
require "mini.files".setup()
require "mini.git".setup()
require "mini.icons".setup()
require "mini.notify".setup()
require "mini.pick".setup()
require "mini.statusline".setup()

vim.lsp.enable({ "denols", "lua_ls", "rust_analyzer", })

-- COLORSCHEME
vim.cmd [[colorscheme midnight]]

-- GLOBALS
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.g.loaded_netrwPlugin = 0

-- OPTIONS
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.completeopt = "menu,menuone,noselect,fuzzy"
vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

-- MAPPINGS
local map = vim.keymap.set
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>s', ':update<CR> :source $MYVIMRC<CR>')
map('n', '<leader>t', '<C-w><S-t>')
map('n', '<leader>f', vim.lsp.buf.format)
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>4', ':split +terminal<CR><C-w>Jz14<CR>i')
map('t', '<esc>', [[<C-\><C-n>]])
map('n', '<leader>e', MiniFiles.open)
map('n', '<leader><leader>', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })

-- NEOVIDE
if vim.g.neovide then
  map('v', '<C-S-c>', '"+y')                 -- Copy
  map('n', '<C-S-v>', '"+P')                 -- Paste normal mode
  map('v', '<C-S-v>', '"+P')                 -- Paste visual mode
  map('c', '<C-S-v>', '<C-R>+')              -- Paste command mode
  map('i', '<C-S-v>', '<ESC>l"+Pli')         -- Paste insert mode
  vim.o.guifont = "IosevkaTerm Nerd Font:14" -- text below applies for VimScript
  vim.g.neovide_cursor_trail_size = 0
end
