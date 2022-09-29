call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'NoahTheDuke/vim-just'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
    set termguicolors
endif

set noerrorbells
set smartindent
set hidden
set rtp+=~/.fzf
set encoding=utf-8
set laststatus=2
set nobackup
set noswapfile
set novb
set title
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartcase
set list
set number
set relativenumber
set nobackup
set clipboard+=unnamedplus
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set completeopt=menuone,preview,noinsert
set wrap
set scrolloff=7
set guicursor=

colorscheme tokyonight

let g:auto_save = 1
let mapleader = " "

map <A-1> :Neotree<CR>
map <A-!> :NeoTreeReveal<CR>
map <A-3> :Commits<CR>
nnoremap <A-q> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <A-w> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <leader>ev :vsp $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>t :vsp term://fish<CR>
tnoremap <Esc> <C-\><C-n><CR>

autocmd TermOpen * startinsert

lua << END
require('lualine').setup()
END
