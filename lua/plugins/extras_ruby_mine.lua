return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = { ensure_installed = { "ruby" } }
  --   -- opts = function(_, opts)
  --   --   vim.list_extend(opts.ensure_installed, {
  --   --     "ruby",
  --   --   })
  --   -- end,
  -- },
  -- seems to be unnecessary??
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, {
  --       "ruby-lsp",
  --       "rubocop",
  --     })
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       ruby_lsp = {
  --         filetypes = { "ruby" },
  --       },
  --       rubocop = {},
  --     },
  --   },
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   -- dependencies = {
  --   --   "suketa/nvim-dap-ruby",
  --   --   config = function()
  --   --     require("dap-ruby").setup()
  --   --   end,
  --   -- },
  --   keys = {
  --     -- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
  --     { "<leader>te", function() require("dap").repl.toggle() end, desc = "DAP Toggle Term" },
  --     { "<leader>tn", function() require("dap").continue() end,  desc = "DAP Next/Continue" },
  --     { "<leader>tb", function() require("dap").toggle_breakpoint() end,  desc = "DAP Toggle Breakpoint" },
  --   },
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "olimorris/neotest-rspec",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-rspec"] = {
  --         -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
  --         -- rspec_cmd = function()
  --         --   return vim.tbl_flatten({
  --         --     "bundle",
  --         --     "exec",
  --         --     "rspec",
  --         --   })
  --         -- end,
  --       },
  --     },
  --   },
  -- },
}
