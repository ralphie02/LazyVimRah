-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local g, opt = vim.g, vim.opt

g.snacks_animate = false -- disable annoying animations
g.autoformat = false -- disable LazyVim autoformat on save
g.lazyvim_ruby_lsp = "ruby_lsp"
g.lazyvim_ruby_formatter = "rubocop"
-- g.loaded_python3_provider = 0
-- g.loaded_node_provider = 0
-- g.loaded_ruby_provider = 0
-- g.ruby_path = vim.fn.system('rbenv prefix') -- github.com/vim-ruby/vim-ruby/issues/248
g.lazyvim_rust_diagnostics = "rust-analyzer"

-- "set regexpengine" == "opt.regexpengine" in case I forget again
-- opt.regexpengine = 1 -- sourcing <nvim7-install..>/syntax/ruby.vim from ~18ms to ~9ms
opt.colorcolumn = "90,100" -- line length guideline
opt.showbreak = " ↪ " -- show linebreak with arrow ↪
opt.linebreak = true -- break line on word, not char
-- opt.wrap = true -- toggle with <leader>uw
opt.clipboard = "" -- overwrite LazyVim's "unnamedplus" default
-- opt.relativenumber = false
