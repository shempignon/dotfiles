call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'cespare/vim-toml'
Plug 'preservim/nerdtree'
Plug '907th/vim-auto-save'
Plug 'timonv/vim-cargo'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'ghifarit53/tokyonight-vim'
Plug 'leafgarland/typescript-vim'
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
set guicursor=

let g:airline_theme='tokyonight'
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 0

colorscheme tokyonight

let g:auto_save = 1

let g:mkdp_browser = 'firefox'

let mapleader = ","

map <A-1> :NERDTreeToggle<CR>
map <A-3> :Commits<CR>
map <A-w> :GitFiles<CR>
map <A-q> :Files<CR>
map <A-e> :Rg<CR>
map <A-r> :CargoRun<CR>
map <A-t> :CargoTest<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <leader>ev :vsp $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>t :vsp term://fish<CR>
tnoremap <Esc> <C-\><C-n><CR>

autocmd TermOpen * startinsert
