-- if true then return {} end
return {
  { -- bufferline
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "NvimTree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = {
        indent = {
          char = "▏",
        },
        scope = {
          char = "▏",
        },
      },
      dashboard = {
        preset = {
          header = [[
            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗  ███████╗  █████╗ ██╗  ██╗          Z
            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║  ██╔═══██╗██╔══██╗██║  ██║      Z    
            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║  ████████║███████║███████║   z       
            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║  ██╔══██╔╝██╔══██║██╔══██║ z         
            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║  ██║  ╚██╗██║  ██║██║  ██║           
            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝  ╚═╝   ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝           
          ]]
        },
      },
    },
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   -- Skip opts due to default values I dislike (ie. blankline char "│" vs "▏")
  --   -- config = function(_, opts)
  --   config = function()
  --     local hooks = require("ibl.hooks")
  --     local highlight = {
  --       "DarkerRainbowRed",
  --       "DarkerRainbowYellow",
  --       "DarkerRainbowBlue",
  --       "DarkerRainbowOrange",
  --       "DarkerRainbowGreen",
  --       "DarkerRainbowViolet",
  --       "DarkerRainbowCyan",
  --     }
  --     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --       -- https://mdigi.tools/darken-color/#56b6c2 40% darker
  --       vim.api.nvim_set_hl(0, "DarkerRainbowRed", { fg = "#a4232d" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowYellow", { fg = "#b07f23" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowBlue", { fg = "#136db7" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowOrange", { fg = "#8f5c2b" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowGreen", { fg = "#59833b" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowViolet", { fg = "#8829a3" })
  --       vim.api.nvim_set_hl(0, "DarkerRainbowCyan", { fg = "#2d737b" })
  --       -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  --       -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  --       -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  --       -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  --       -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  --       -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  --       -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  --     end)
  --     require("ibl").setup({ indent = { highlight = highlight } })
  --   end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      -- MY EDIT: START --
      local my_catppuccin_frappe = require('lualine.themes.catppuccin-frappe')
      my_catppuccin_frappe.inactive.c = { fg = '#2c323c', bg = 'silver' }
      my_catppuccin_frappe.normal.c.bg = '#2c2b88'
      -- MY EDIT: END --

      local opts = {
        options = {

          -- MY EDIT: START --
          theme = my_catppuccin_frappe,
          -- MY EDIT: END --

          globalstatus = false,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },

          -- MY EDIT: START --
          -- remove separators to get more space; useful when branch and filepaths are long
          component_separators = {},
          section_separators = {},
          -- MY EDIT: END --
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
              -- MY EDIT: START --
              padding = { left = 1, right = 0 },
              -- MY EDIT: END --
            },
            -- MY EDIT: START --
            { 'filename', path = 1, padding = 0 },
            -- MY EDIT: END --
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          lualine_x = {
            Snacks.profiler.status(),
            -- stylua: ignore
                        {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
            -- MY EDIT: START --
            -- moved diff to lualine_y
            -- MY EDIT: END --
          },
          -- MY EDIT: START --
          -- moved lualine_y to lualine_z
          lualine_y = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          -- MY EDIT: END --
          -- MY EDIT: START --
          -- moved lualine_y to lualine_z + removed original lualine_z
          lualine_z = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          -- MY EDIT: END --
        },
        inactive_sections = {
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { { 'encoding', padding = 0 }, 'fileformat' },
        },
        extensions = { "nvim-tree", "lazy" },
      }

      -- do not add trouble symbols if aerial is enabled
      -- And allow it to be overriden for some buffer types (see autocmds)
      if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
        local trouble = require("trouble")
        local symbols = trouble.statusline({
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end

      return opts
    end,
  },
}
