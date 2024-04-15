return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textobjects = {
        lsp_interop = {
          enable = true,
          floating_preview_opts = {
            border = 'rounded',
          },
          peek_definition_code = {
            ["<leader>cd"] = { query = "@function.outer", desc = "Definition func outer" },
            ["<leader>cD"] = { query = "@class.outer", desc = "Definition class outer" },
          },
        },
      },
    },
  },
}
