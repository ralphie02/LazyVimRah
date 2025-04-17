-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove keymaps to move lines up/down: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L25
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

vim.keymap.set('v', 'y', '"+y') -- v-mode: yank to clipboard;
local function toggle_rb_spec()
  -- rails
  if vim.fn.filereadable("config/application.rb") == 1 then
    if vim.fn.expand("%:t"):match("_spec%.rb$") then
      vim.cmd("edit " .. vim.fn.expand("%:h"):gsub("spec", "app") .. "/" .. vim.fn.expand("%:t"):gsub("_spec%.rb$", ".rb"))
    else
      vim.cmd("edit " .. vim.fn.expand("%:h"):gsub("app", "spec") .. "/" .. vim.fn.expand("%:t"):gsub("%.rb$", "_spec.rb"))
    end
  end

end
local function toggle_rspec()
  vim.cmd("lcd " .. vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", ""))

  if vim.bo.filetype == "ruby" and vim.fn.filereadable("Gemfile") == 1 then
    toggle_rb_spec()
  else
    vim.notify("Unsupported file type and/or project", vim.log.levels.WARN)
  end
end
vim.keymap.set('n', '<leader>ti', toggle_rspec, { silent = true, desc = "Toggle Test F(i)le" })
vim.keymap.set("n", "<leader>ci", vim.diagnostic.open_float, { desc = "Code D(i)agnostics" })
vim.keymap.set({ "n", "v" }, "*", [[:<C-u>let @/='\<'.expand('<cword>').'\>'|set hls<cr>]], { silent = true, desc = "No jump highlight"}) -- https://superuser.com/a/255120
vim.keymap.set({ "n", "v" }, "g*", [[:<C-u>let @/=expand('<cword>')|set hls<cr>]], { silent = true, desc = "No jump highlight"}) -- https://stackoverflow.com/a/49944815
