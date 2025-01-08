return {
  "kdheepak/lazygit.nvim",
  -- event = "VeryLazy",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  config = function()
    local wk = require "which-key"

    wk.add {
      { "<leader>gg", group = "Git" },
      { "<leader>alg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    }
  end,
}
