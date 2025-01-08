return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  branch = "regexp",
  opts = {
    -- Your options go here
    name = ".venv",
    -- auto_refresh = false
  },
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.add {
      { "<leader>ap", group = "Python" },
      { "<leader>aps", "<cmd>VenvSelect<cr>", desc = "Select Virtual Env" },
      { "<leader>apc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Virtual Env" },
    }
  end,
}
