return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- run synchronously so Lazy waits for it and reports failures.
    -- tslib is installed explicitly because the bundled server requires it
    -- but it is not pulled in by the plugin's own package.json.
    build = "cd app && npm install && npm install tslib",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      {
        "<leader>cp",
        "<cmd>MarkdownPreviewToggle<cr>",
        ft = "markdown",
        desc = "Markdown Preview",
      },
    },
  },
}
