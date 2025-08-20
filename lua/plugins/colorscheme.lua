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
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
  }
}
