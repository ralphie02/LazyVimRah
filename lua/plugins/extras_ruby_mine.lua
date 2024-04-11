return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "ruby",
      }
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      -- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#introduction
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        "ruby-lsp",
        "rubocop",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_ls = {},
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
    keys = {
      { "<leader>te", function() require("dap").repl.open() end, desc = "Debug T(e)rminal" },
      { "<leader>tn", function() require("dap").continue() end,  desc = "Debug Next/Continue" },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
      },
    },
  },
}
