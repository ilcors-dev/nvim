return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      numhl = false, -- Disable line number highlighting
      linehl = false, -- Disable line highlighting
      word_diff = false, -- Disable word diff
      current_line_blame = true, -- Enable inline Git blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- Show blame at the end of the line
        delay = 1000, -- Delay before showing blame
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      update_debounce = 100,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = { enable = false },
    }

    local wk = require "which-key"

    wk.add {
      { "<leader>gg", group = "Git" },
      { "<leader>agb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Git Blame" },
      { "<leader>agr", ":Gitsigns preview_hunk<CR>", desc = "Preview Git Hunk" },
      { "<leader>agr", ":Gitsigns reset_hunk<CR>", desc = "Reset Git Hunk" },
      { "<leader>ags", ":Gitsigns stage_hunk<CR>", desc = "Stage Git Hunk" },
    }
  end,
}
