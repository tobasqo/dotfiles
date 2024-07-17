return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      auto_save_enabled = true,
      auto_restore_enabled = true,
      pre_save_cmds = { "tabdo Neotree close" },
      post_restore_cmds = { "Neotree" },
    })
  end,
}
