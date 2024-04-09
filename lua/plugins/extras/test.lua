return {
  { "olimorris/neotest-rspec" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-rspec"
      }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    -- config = function(_, opts)
    --   require("neotest").setup(opts)
    -- end
  },
}
