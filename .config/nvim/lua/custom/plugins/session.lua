return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      auto_restore = true,
      auto_restore_last_session = false,
      auto_save = true,
      enabled = true,
      log_level = "info",
      post_restore_cmds = { "Neotree" },
      root_dir = vim.fn.stdpath("data") .. "/sessions/",
      use_git_branch = true,
    })
  end,
}
