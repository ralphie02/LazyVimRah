return {
  -- comment plugin
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = {
      keymap = {
        preset = 'none',
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      },
    },
  },
}
