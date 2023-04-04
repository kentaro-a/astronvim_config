return {
  { "EdenEast/nightfox.nvim" },
  { "rapan931/lasterisk.nvim" },
  { 'kevinhwang91/nvim-hlslens' },
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
  }
}
