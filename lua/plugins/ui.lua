-- if true then return {} end
return {
  { -- bufferline
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "NvimTree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- Skip opts due to default values I dislike (ie. blankline char "│" vs "▏")
    -- config = function(_, opts)
    config = function()
      local hooks = require("ibl.hooks")
      local highlight = {
        "DarkerRainbowRed",
        "DarkerRainbowYellow",
        "DarkerRainbowBlue",
        "DarkerRainbowOrange",
        "DarkerRainbowGreen",
        "DarkerRainbowViolet",
        "DarkerRainbowCyan",
      }
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- https://mdigi.tools/darken-color/#56b6c2 40% darker
        vim.api.nvim_set_hl(0, "DarkerRainbowRed", { fg = "#a4232d" })
        vim.api.nvim_set_hl(0, "DarkerRainbowYellow", { fg = "#b07f23" })
        vim.api.nvim_set_hl(0, "DarkerRainbowBlue", { fg = "#136db7" })
        vim.api.nvim_set_hl(0, "DarkerRainbowOrange", { fg = "#8f5c2b" })
        vim.api.nvim_set_hl(0, "DarkerRainbowGreen", { fg = "#59833b" })
        vim.api.nvim_set_hl(0, "DarkerRainbowViolet", { fg = "#8829a3" })
        vim.api.nvim_set_hl(0, "DarkerRainbowCyan", { fg = "#2d737b" })
        -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
}
