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
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "original"

      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette =
        vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
      local set_hl = vim.fn["gruvbox_material#highlight"]

      set_hl("function", palette.none, "689d6a")

      vim.cmd.colorscheme("gruvbox-material")

      require("lualine").setup({
        options = {
          theme = "gruvbox-material",
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
