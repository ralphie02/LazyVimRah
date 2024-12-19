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
}
