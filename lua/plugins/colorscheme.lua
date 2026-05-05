return {
  {
    "catppuccin/nvim",
    opts = {
      dim_inactive = {
        enabled = true,
        percentage = 2,
      },
    --   integrations = {
    --     native_lsp = {
    --       enabled = false,
    --     },
    --   },
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
       -- colorscheme = "catppuccin-frappe",
       -- colorscheme = "catppuccin-latte",
       -- colorscheme = "catppuccin-mocha",
    }
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   init = function()
  --     local bufline = require("catppuccin.groups.integrations.bufferline")
  --     function bufline.get()
  --       return bufline.get_theme()
  --     end
  --   end,
  -- }
}
