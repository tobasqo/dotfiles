-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>"),
    vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>"),
    vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>"),
    vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>"),
  },

  { "windwp/nvim-ts-autotag" },

  { "echasnovski/mini.move" },

  { "nvim-treesitter/nvim-treesitter-context" },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
