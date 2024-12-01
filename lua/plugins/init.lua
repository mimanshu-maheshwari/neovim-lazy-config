return {
  { "numToStr/Comment.nvim", lazy = false },
  { "saecki/crates.nvim", lazy = true },
  { "onsails/lspkind.nvim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function() end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        -- "rust-analyzer",
        "prettier",
      },
    },
  },
  { "mfussenegger/nvim-dap", lazy = true },
  { "BurntSushi/ripgrep" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Telescope Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Telescope live greps",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Telescope help tags",
      },
    },
  },
  { "folke/todo-comments.nvim", lazy = false },
  { "tpope/vim-surround", lazy = false },
  {
    "neoclide/coc.nvim",
    branch = "master",
    build = "npm ci",
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
    },
    config = function() -- ...
    end,
  },

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua",
        "c",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "rust",
        "java",
      },
      auto_install = true,
    },
  },
  {
    "Wansmer/treesj",
    keys = { { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" } },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    opts = {},
    keys = {
      {
        "n",
        "<leader>a",
        function()
          vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
        end,
        { silent = true, buffer = vim.api.nvim_get_current_buf() },
      },
      {
        "n",
        "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
          vim.cmd.RustLsp({ "hover", "actions" })
        end,
        { silent = true, buffer = vim.api.nvim_get_current_buf() },
      },
    },
    config = function() end,
    dependencies = {
      "mattn/webapi-vim",
    },
  },
}
