return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function () require("neo-tree").setup {
      close_if_last_window = true,
      window = {
        width = 60,
        position = "right",
      },
    } end,
    keys = {
      {
        "<leader>o",
        function () require("neo-tree.command").execute({ reveal = true }) end,
        desc = "Reveal in file tree",
      },
      {
        "<leader>e",
        function () require("neo-tree.command").execute({ toggle = true }) end,
        desc = "Toggle file tree",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  "lewis6991/gitsigns.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "nvim-lualine/lualine.nvim",
    config = function () require("lualine").setup {
      options = {
        theme = "tokyonight",
      },
    } end,
  },
  {
    "williamboman/mason.nvim",
    config = function () require("mason").setup() end,
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-treesitter/nvim-treesitter",
    config = function () require("nvim-treesitter.configs").setup {
      ensure_installed =  { "lua", "vim", "rust", "typescript", },
      auto_install = true,
    } end,
  },
  {
    "echasnovski/mini.nvim",
    config = function () require("mini.comment").setup() end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function () require("telescope").setup() end,
    keys = {
      {
        "<leader><leader>",
        function() require("telescope.builtin").git_files() end,
        desc = "Find files (git)"
      },
      {
        "<leader>fg",
        function() require("telescope.builtin").live_grep() end,
        desc = "Live grep"
      },
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Find files"
      },
    },
  },
  "EdenEast/nightfox.nvim",
  "folke/tokyonight.nvim",
  "Pocco81/auto-save.nvim",
}
