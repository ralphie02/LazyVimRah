return {
  {
    -- The plugin is "catppuccin/nvim" but LazyVim calls it "catppuccin"
    "catppuccin",
    opts = {
      flavour = "frappe",
      dim_inactive = {
        enabled = true,
        percentage = 0.05,
      }
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  },
}
