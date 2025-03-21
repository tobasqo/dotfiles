return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme("tokyonight-storm")

      -- You can configure highlights by doing something like:
      vim.cmd.hi("Comment gui=none")
      -- vim.cmd.colorscheme("tokyonight-storm")
    end,
    opts = {
      on_highlights = function(hl, c)
        hl["@constructor"] = { fg = c.blue1 }
        hl["Include"] = { fg = c.purple }
        hl["@constant.builtin"] = { fg = c.cyan }
        hl["@punctuation.bracket"] = { fg = c.cyan }
        hl["@parameter"] = { fg = c.none }
        hl["PreProc"] = { fg = c.blue6 }
        hl["Number"] = { fg = c.yellow }
        hl["@float"] = { fg = c.yellow }
        hl["Boolean"] = { fg = c.yellow }
        hl["@exception"] = { fg = c.orange }
      end,
    },
  },
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.g.gruvbox_material_background = "medium"
  --     vim.g.gruvbox_material_foreground = "original"
  --
  --     local config = vim.fn["gruvbox_material#get_configuration"]()
  --     local palette =
  --       vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
  --     local set_hl = vim.fn["gruvbox_material#highlight"]
  --
  --     set_hl("function", palette.none, "689d6a")
  --
  --     vim.cmd.colorscheme("gruvbox-material")
  --
  --     require("lualine").setup({
  --       options = {
  --         theme = "gruvbox-material",
  --       },
  --     })
  --   end,
  -- },
  {
    -- help github-nvim-theme
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- override syntax groups
        specs = {
          github_dark_dimmed = {
            syntax = {
              operator = "#f47067",
            },
          },
        },
        groups = {
          github_dark_dimmed = {
            ["@punctuation.delimiter"] = { fg = "#77bdfb" },
            ["@parameter"] = { fg = "red" },
            ["@module.python"] = { fg = "#adbac7" },
          },
        },
      })

      vim.cmd.colorscheme("github_dark_dimmed")

      -- export colors palette
      local palette = require("github-theme.palette").load("github_dark_dimmed")
      vim.fn.writefile(vim.inspect(palette), "theme_colors.txt")
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local set_hl = vim.api.nvim_set_hl
      -- define colors for brackets
      set_hl(0, "bracket1", { fg = "#dcbdfb" })
      set_hl(0, "bracket2", { fg = "#6cb6ff" })
      set_hl(0, "bracket3", { fg = "#96d0ff" })
      set_hl(0, "bracket4", { fg = "#7ce38b" })
      set_hl(0, "bracket5", { fg = "#faa356" })
      set_hl(0, "bracket6", { fg = "#ff938a" })
      set_hl(0, "bracket7", { fg = "#539bf5" })
      -- override brackets colors
      set_hl(0, "RainbowDelimiterRed", { link = "bracket1" })
      set_hl(0, "RainbowDelimiterYellow", { link = "bracket2" })
      set_hl(0, "RainbowDelimiterBlue", { link = "bracket3" })
      set_hl(0, "RainbowDelimiterOrange", { link = "bracket4" })
      set_hl(0, "RainbowDelimiterGreen", { link = "bracket5" })
      set_hl(0, "RainbowDelimiterViolet", { link = "bracket6" })
      set_hl(0, "RainbowDelimiterCyan", { link = "bracket7" })
      -- result
      -- ({
      --   {
      --     {
      --       {
      --         -- starting from this
      --         { { { { { { {} } } } } } },
      --       },
      --     },
      --   },
      -- })
    end,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "tokyonight-storm",
  --   },
  -- },
}
