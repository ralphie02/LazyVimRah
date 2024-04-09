-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove keymaps to move lines up/down: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L25
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

vim.keymap.set('v', 'y', '"*y') -- v-mode: yank to clipboard;
