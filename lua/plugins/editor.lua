return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
          -- jump = {
          --   nohlsearch = false,
          -- },
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = {
  --     defaults = {
  --       file_ignore_patterns = { "%.min%.js" }
  --     }
  --   },
  -- },
  {
    "ibhagwan/fzf-lua",
    opts = {
      file_ignore_patterns = {
        "%.min%.js",
        ".git/",
        "dist/",
        "build/",
        "target/",
        "node_modules/",
      },
    },
  },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    }
  }
}
