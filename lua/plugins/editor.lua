-- if true then return {} end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fe", function() require("nvim-tree.api").tree.toggle({ path = LazyVim.root() }) end, desc = "Explorer NvimTree (Root)" },
      { "<leader>fE", function() require("nvim-tree.api").tree.toggle({ path = vim.uv.cwd() }) end, desc = "Explorer NvimTree (cwd)" },
      { "<leader>e", "<leader>fe", desc = "Explorer NvimTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NvimTree (cwd)", remap = true },
    },
    config = function()
      require("nvim-tree").setup({
        -- actions = {
        --   open_file = {
        --     resize_window = false,
        --   },
        -- },
      })
    end,
  },
}
