return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>"),
  vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>"),
  vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>"),
  vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>"),
}
