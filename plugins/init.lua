return {
  { "EdenEast/nightfox.nvim" },
  { "rapan931/lasterisk.nvim" },
  {
    'kevinhwang91/nvim-hlslens',
    as = 'hlslens',
    config = function()
      require 'hlslens'.setup({
        show_count = false, -- This disables the [N/M] counter display
      })
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

  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      keymap(
        "i",
        "<C-g>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-j>", "<Plug>(copilot-next)")
      keymap("i", "<C-k>", "<Plug>(copilot-previous)")
      keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
      keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
    end,
    lazy = false,
  },

}
