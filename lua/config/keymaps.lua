-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove keymaps to move lines up/down: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L25
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

local toggle_rspec = [[:lcd `git rev-parse --show-toplevel` | if expand("%:r")[-5:-1] == "_spec" |
  exe "e ".expand("%:h:s?spec?app?")."/".expand("%:t:s?_spec.rb?.rb?") | else |
  exe "e ".expand("%:h:s?app?spec?")."/".expand("%:t:s?.rb?_spec.rb?") | endif
]]
vim.keymap.set('n', '<leader>tf', toggle_rspec, { silent = true, desc = "Toggle test (f)ile" })
vim.keymap.set('v', 'y', '"+y') -- v-mode: yank to clipboard;
