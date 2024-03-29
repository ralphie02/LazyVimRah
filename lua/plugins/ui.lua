-- if true then return {} end

return {
  -- bufferline
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-tree.lua" },
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
}
