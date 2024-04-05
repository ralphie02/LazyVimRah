return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#introduction
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        "rubocop",
        "stylua",
        "shfmt",
      },
    },
  },
}
