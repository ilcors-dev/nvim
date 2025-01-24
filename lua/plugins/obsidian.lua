local vault_path = os.getenv "OBSIDIAN_VAULT_PATH"
if not vault_path then error "Environment variable OBSIDIAN_VAULT_PATH is not set!" end

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("'" .. vault_path .. "/**/*.md'"),
    "BufNewFile " .. vim.fn.expand("'" .. vault_path .. "/**/*.md'"),
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand(vault_path),
      },
    },
  },
}
