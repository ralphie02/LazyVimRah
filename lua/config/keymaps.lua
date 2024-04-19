-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove keymaps to move lines up/down: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L25
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

vim.keymap.set('v', 'y', '"+y') -- v-mode: yank to clipboard;
local toggle_rspec = [[:lcd `git rev-parse --show-toplevel` | if expand("%:r")[-5:-1] == "_spec" |
  exe "e ".expand("%:h:s?spec?app?")."/".expand("%:t:s?_spec.rb?.rb?") | else |
  exe "e ".expand("%:h:s?app?spec?")."/".expand("%:t:s?.rb?_spec.rb?") | endif
]]
vim.keymap.set('n', '<leader>ti', toggle_rspec, { silent = true, desc = "Toggle Test F(i)le" })
vim.keymap.set("n", "<leader>ci", vim.diagnostic.open_float, { desc = "Code D(i)agnostics" })
vim.keymap.set("n", "*", [[:let @/ = '\<'.expand('<cword>').'\>'|set hlsearch<CR>]], { desc = "No jump highlight"}) -- https://superuser.com/a/255120
