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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- Skip opts due to default values I dislike (ie. blankline char "│" vs "▏")
    -- config = function(_, opts)
    config = function()
      local hooks = require("ibl.hooks")
      local highlight = {
        "DarkerRainbowRed",
        "DarkerRainbowYellow",
        "DarkerRainbowBlue",
        "DarkerRainbowOrange",
        "DarkerRainbowGreen",
        "DarkerRainbowViolet",
        "DarkerRainbowCyan",
      }
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- https://mdigi.tools/darken-color/#56b6c2 40% darker
        vim.api.nvim_set_hl(0, "DarkerRainbowRed", { fg = "#a4232d" })
        vim.api.nvim_set_hl(0, "DarkerRainbowYellow", { fg = "#b07f23" })
        vim.api.nvim_set_hl(0, "DarkerRainbowBlue", { fg = "#136db7" })
        vim.api.nvim_set_hl(0, "DarkerRainbowOrange", { fg = "#8f5c2b" })
        vim.api.nvim_set_hl(0, "DarkerRainbowGreen", { fg = "#59833b" })
        vim.api.nvim_set_hl(0, "DarkerRainbowViolet", { fg = "#8829a3" })
        vim.api.nvim_set_hl(0, "DarkerRainbowCyan", { fg = "#2d737b" })
        -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function()
      local logo = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗███████╗  █████╗ ██╗  ██╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║██╔═══██╗██╔══██╗██║  ██║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║████████║███████║███████║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╔╝██╔══██║██╔══██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ║██╗██║  ██║██║  ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝           
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = LazyVim.telescope("files"), desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
            { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
            { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config", icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
