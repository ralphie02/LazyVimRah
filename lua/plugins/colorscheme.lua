return {
  {
    "catppuccin/nvim",
    opts = {
      dim_inactive = {
        enabled = true,
        percentage = 2,
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
      colorscheme = "catppuccin-macchiato", -- "catppuccin-frappe", "catppuccin-latte", "catppuccin-mocha",
    }
  },
}
