return {
  { "EdenEast/nightfox.nvim" },
  { "rapan931/lasterisk.nvim" },
  {
    'kevinhwang91/nvim-hlslens',
    as = 'hlslens',
    config = function()
      require 'hlslens'.setup()
    end
  },
  {
    "phaazon/hop.nvim",
    as = 'hop',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "roobert/search-replace.nvim",
    config = function()
      vim.o.inccommand = "split"
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
    lazy = false,
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   lazy = false,
  -- },

  -- telescope
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },

  

}
