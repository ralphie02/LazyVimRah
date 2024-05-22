return {
  {
    -- The plugin is "catppuccin/nvim" but LazyVim calls it "catppuccin"
    "catppuccin",
    opts = {
      flavour = "frappe",
      dim_inactive = {
        enabled = true,
        percentage = 0.05,
      },
      integrations = {
        native_lsp = {
          enabled = false,
        },
      },
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  },
}
