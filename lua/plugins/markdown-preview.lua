return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function() vim.g.mkdp_filetypes = { "markdown" } end,
  ft = { "markdown" },
  config = function()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_browser = ""

    local wk = require "which-key"

    wk.add {
      { "<leader>am", group = "Markdown" }, -- Subgroup for Markdown
      { "<leader>amh", "<cmd>MarkdownPreview<CR>", desc = "Start and open Preview" },
      { "<leader>amt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Preview" },
      { "<leader>ams", "<cmd>MarkdownPreviewStop<CR>", desc = "Stop Preview" },
    }
  end,
}
