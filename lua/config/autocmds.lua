-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://github.com/LazyVim/LazyVim/issues/2592#issuecomment-1962891151
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimAutocmds",
  callback = function()
    -- vim.notify("I run AFTER the vim.notify in schedule")
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false })
    end

    -- NOTE: Use vim.schedule when you need to perform an action asynchronously
    --  or when you want to defer execution until the event loop is ready.
    --  The function is run *before* any lua code above it.

    -- vim.schedule(function()
    --   vim.notify("I run before the vim.notify above")
    -- end)
  end,
})
