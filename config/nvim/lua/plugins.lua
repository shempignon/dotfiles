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
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
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
    opts = {
      notify = { enabled = false },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  "folke/which-key.nvim",
  {
    "nvim-lualine/lualine.nvim",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("mason-lspconfig").setup{
        ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "emmet-language-server" },
      };
      require("mason-lspconfig").setup_handlers {
        function (server_name)
          require("lspconfig")[server_name].setup {}
        end,
      };
    end,
  },
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
    config = function ()
      require("telescope").setup()
      require("telescope").load_extension("aerial")
    end,
    keys = {
      {
        "<leader><leader>",
        function() require("telescope.builtin").git_files() end,
        desc = "Find files (git)"
      },
      {
        "<leader>g",
        function() require("telescope.builtin").live_grep() end,
        desc = "Live grep"
      },
      {
        "<leader>w",
        function() require("telescope.builtin").find_files() end,
        desc = "Find files"
      },
      {
        "<leader>ff",
        function()
          require("telescope").extensions.aerial.aerial()
        end,
        desc = "Show file navigation",
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {},
    keys = {{
      "<leader>4",
      "<cmd>ToggleTerm size=20 direction=float<cr>",
      desc = "Toggle terminal",
    }},
  },
  "folke/tokyonight.nvim",
  "Pocco81/auto-save.nvim",
}
