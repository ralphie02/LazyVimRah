-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove keymaps to move lines up/down: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L25
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.set('v', 'y', '"+y') -- v-mode: yank to clipboard;
vim.keymap.set("n", "<leader>ci", vim.diagnostic.open_float, { desc = "Code D(i)agnostics" })
vim.keymap.set({ "n", "v" }, "*", [[:<C-u>let @/='\<'.expand('<cword>').'\>'|set hls<cr>]], { silent = true, desc = "No jump highlight"}) -- https://superuser.com/a/255120
vim.keymap.set({ "n", "v" }, "g*", [[:<C-u>let @/=expand('<cword>')|set hls<cr>]], { silent = true, desc = "No jump highlight"}) -- https://stackoverflow.com/a/49944815

local function toggle_rb_test_dir()
  if vim.g.rah_test_dir == "spec" then
    vim.g.rah_test_dir = "test"
  else
    vim.g.rah_test_dir = "spec"
  end
end

local function toggle_test_dir()
  local file_ext = vim.fn.expand("%:e")

  if not vim.g.rah_test_dir then
    vim.notify("Toggline test file for '." .. file_ext .. "' is unsupported", vim.log.levels.INFO)
    return
  end

  if file_ext == "rb" then
    toggle_rb_test_dir()
  end
  vim.notify("Test directory set to: " .. vim.g.rah_test_dir, vim.log.levels.INFO)
end
vim.keymap.set("n", "<leader>td", toggle_test_dir, { silent = true, desc = "Toggle Test Dir" })

local function toggle_rb_spec()
  local test_dir = vim.g.rah_test_dir
  -- rails
  if vim.fn.filereadable("config/application.rb") == 1 then
    if vim.fn.expand("%:t"):match("_spec%.rb$") then
      vim.cmd("edit " .. vim.fn.expand("%:h"):gsub(test_dir, "app") .. "/" .. vim.fn.expand("%:t"):gsub("_" .. test_dir .. "%.rb$", ".rb"))
    else
      vim.cmd("edit " .. vim.fn.expand("%:h"):gsub("^app", test_dir) .. "/" .. vim.fn.expand("%:t"):gsub("%.rb$", "_" .. test_dir .. ".rb"))
    end
  end
end

local function toggle_rspec()
  vim.cmd("lcd " .. vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", ""))

  if vim.fn.expand("%:e") == "rb" and vim.fn.filereadable("Gemfile") == 1 then
    toggle_rb_spec()
  else
    vim.notify("Unsupported filetype and/or project", vim.log.levels.WARN)
  end
end
vim.keymap.set('n', '<leader>ti', toggle_rspec, { silent = true, desc = "Toggle Test F(i)le" })
vim.keymap.set('n', '<leader>tt',
  function ()
    vim.fn.setreg("+", "bundle exec rspec " .. vim.fn.expand("%"))
    local opts = { cwd = LazyVim.root(), interactive = true }
    local term, _ = Snacks.terminal.get(nil, opts)

    if term then
      if term.closed == true then
        Snacks.terminal(nil, opts)
      else
        term:focus()
      end
    end
  end, { silent = true, desc = "Toggle Test Terminal" })
