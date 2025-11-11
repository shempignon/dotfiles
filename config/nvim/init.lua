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

add({ source = "nvim-treesitter/nvim-treesitter", checkout = "master" })
add({ source = "neovim/nvim-lspconfig" })
add({ source = "mason-org/mason.nvim" })
add({ source = "catppuccin/nvim", name = "catppuccin" })
add({
  source = 'nvim-neo-tree/neo-tree.nvim',
  checkout = 'v3.x',
  depends = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  }
})
add({ source = "folke/which-key.nvim" })
add({ source = "akinsho/toggleterm.nvim" })
add({
  source = "nvim-telescope/telescope.nvim",
  checkout = '0.1.8',
  depends = { "nvim-lua/plenary.nvim", }
})

require "mason".setup()
require "mini.git".setup()
require "mini.icons".setup()
require "mini.notify".setup()
require "mini.diff".setup()
require "mini.statusline".setup()
require "toggleterm".setup()
require "nvim-treesitter.configs".setup({
  ensure_installed = { "lua", "rust", "json", "html", "vento", "typescript", "sql", "javascript" },
  highlight = { enable = true },
})


vim.lsp.enable({ "denols", "lua_ls", "rust_analyzer", "jsonls" })

-- COLORSCHEME
require "catppuccin".setup({
  transparent_background = true,
  float = {
    transparent = true,
  },
})
vim.cmd [[
  colorscheme catppuccin-mocha
]]

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
map('n', '<leader>f', vim.lsp.buf.format)
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>4', ':ToggleTerm<CR>')
map('t', '<esc>', [[<C-\><C-n>]])
map('n', '<leader>e', ':Neotree filesystem toggle right<CR>')
map('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
local builtin = require('telescope.builtin')
map('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>tr', builtin.lsp_references, { desc = 'Telescope lsp references' })
map('n', '<leader>ts', builtin.lsp_document_symbols, { desc = 'Telescope lsp symbols' })

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


-- AUTOCOMMANDS

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})
