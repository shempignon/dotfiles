local opt = vim.opt

opt.termguicolors=true
opt.errorbells=false
opt.smartindent=true
opt.hidden=true
opt.encoding='utf-8'
opt.laststatus=2
opt.backup=false
opt.swapfile=false
opt.vb=false
opt.title=true
opt.expandtab=true
opt.tabstop=2
opt.softtabstop=2
opt.shiftwidth=2
opt.smartcase=true
opt.number=true
opt.relativenumber=true
opt.clipboard:append('unnamedplus')
opt.undodir='~/.config/nvim/undodir'
opt.incsearch=true
opt.completeopt='menuone,preview,noinsert'
opt.wrap=true
opt.scrolloff=7

vim.cmd[[colorscheme tokyonight]]
vim.g["auto_save"] = 1
