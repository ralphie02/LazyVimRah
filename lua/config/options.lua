-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local g, opt = vim.g, vim.opt

g.autoformat = false -- disable LazyVim autoformat on save
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.ruby_path = vim.fn.system('rbenv prefix') -- github.com/vim-ruby/vim-ruby/issues/248

opt.regexpengine = 1 -- sourcing <nvim7-install..>/syntax/ruby.vim from ~18ms to ~9ms
opt.colorcolumn = "90,100" -- line length guideline
opt.showbreak = " ↪ " -- show linebreak with arrow ↪
opt.linebreak = true -- break line on word, not char
-- opt.wrap = true -- toggle with <leader>uw

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- when available, auto update when vim starts
-- as per discussion here: https://github.com/LazyVim/LazyVim/issues/2592#issuecomment-2015093693
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates() then
      require("lazy").update({ show = true })
    end
  end,
})
