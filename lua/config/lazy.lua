local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    --
    -- added then proceeded to disable
    -- { import = "lazyvim.plugins.extras.lang.ruby" },
    --
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },

    -- include copilot
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.test.core" },
    -- import/override with your plugins - should be last since these are my customizations
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- ---------------------------
-- -------  TEMPORARY  -------
-- ---------------------------
-- -- textDocument/diagnostic support until 0.10.0 is released
-- local _timers = {}
-- local function setup_diagnostics(client, buffer)
--   if require("vim.lsp.diagnostic")._enable then
--     return
--   end
--
--   local diagnostic_handler = function()
--     local params = vim.lsp.util.make_text_document_params(buffer)
--     client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
--       if err then
--         local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
--         vim.lsp.log.error(err_msg)
--       end
--       local diagnostic_items = {}
--       if result then
--         diagnostic_items = result.items
--       end
--       vim.lsp.diagnostic.on_publish_diagnostics(
--         nil,
--         vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
--         { client_id = client.id }
--       )
--     end)
--   end
--
--   diagnostic_handler() -- to request diagnostics on buffer when first attaching
--
--   vim.api.nvim_buf_attach(buffer, false, {
--     on_lines = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--       _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
--     end,
--     on_detach = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--     end,
--   })
-- end
--
-- -- adds ShowRubyDeps command to show dependencies in the quickfix list.
-- -- add the `all` argument to show indirect dependencies as well
-- local function add_ruby_deps_command(client, bufnr)
--   vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
--     local params = vim.lsp.util.make_text_document_params()
--     local showAll = opts.args == "all"
--
--     client.request("rubyLsp/workspace/dependencies", params, function(error, result)
--       if error then
--         print("Error showing deps: " .. error)
--         return
--       end
--
--       local qf_list = {}
--       for _, item in ipairs(result) do
--         if showAll or item.dependency then
--           table.insert(qf_list, {
--             text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
--
--             filename = item.path,
--           })
--         end
--       end
--
--       vim.fn.setqflist(qf_list)
--       vim.cmd("copen")
--     end, bufnr)
--   end, {
--     nargs = "?",
--     complete = function()
--       return { "all" }
--     end,
--   })
-- end
--
-- require("lspconfig").ruby_lsp.setup({
--   on_attach = function(client, buffer)
--     setup_diagnostics(client, buffer)
--     add_ruby_deps_command(client, buffer)
--   end,
-- })
-- ---------------------------
-- -------  TEMPORARY  -------
-- ---------------------------
