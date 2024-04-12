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
            ["<leader>fd"] = "@function.outer",
            ["<leader>fD"] = "@class.outer",
          },
        },
      },
    },
  },
}
