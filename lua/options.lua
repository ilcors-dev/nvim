vim.opt.termguicolors = true
vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"

require("neo-tree").setup {
  window = {
    position = "right",
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}
