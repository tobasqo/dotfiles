return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_session_suppress_dirs = nil,
      auto_session_use_git_branch = true,
      bypass_session_save_file_types = nil,
      -- pre_save_cmds = { "tabdo Neotree close" },
      post_restore_cmds = { "Neotree" },
    })
  end,
}
