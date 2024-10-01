return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      -- auto_clean_after_session_restore = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          show_hidden_count = false,
        },
        window = {
          width = 30,
        },
      },
    })
  end,
}
