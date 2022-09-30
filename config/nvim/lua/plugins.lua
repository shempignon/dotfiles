return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    }
  }
  use {
  'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = require 'neo-tree'.setup {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
        }
      }
    }
  }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use '907th/vim-auto-save'
  use 'NoahTheDuke/vim-just'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    config = require 'lualine'.setup {
      options = { theme = 'tokyonight' }
    }
  }
end)
