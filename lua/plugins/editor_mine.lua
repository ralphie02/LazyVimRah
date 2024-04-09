-- if true then return {} end
return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>fe",
        function()
          require("nvim-tree.api").tree.toggle({ path = LazyVim.root() })
        end,
        desc = "Explorer NvimTree (Root)",
      },
      {
        "<leader>fE",
        function()
          require("nvim-tree.api").tree.toggle({ path = vim.uv.cwd() })
        end,
        desc = "Explorer NvimTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NvimTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NvimTree (cwd)", remap = true },
      {
        "<leader>0",
        function()
          -- opens and closes explorer on file location
          -- require("nvim-tree.api").tree.toggle({ update_root = true, find_file = true, focus = true })
          require("nvim-tree.api").tree.find_file({ update_root = true, open = true, focus = true })
        end,
        desc = "Find File in Explorer",
      },
    },
    deactivate = function()
      require("nvim-tree.api").tree.close()
    end, -- or function() vim.cmd([[NvimTreeClose]]) end
    -- Note: Copied from LazyVim config for Neo-tree
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.uv.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("nvim-tree")
        end
      end
    end,
    opts = {
      -- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#custom-mappings
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end,
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    opts = {
      default_mappings = true,
      resizing_mappings = true,
    },
    config = function(_, opts)
      require("goto-preview").setup(opts)
    end,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          jump = {
            nohlsearch = false,
          },
        },
      },
    },
  }
}
