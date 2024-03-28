if true then return {} end

return {
  -- bufferline
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "Nvim-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
