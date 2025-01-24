vim.opt.termguicolors = true
vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"

require("neo-tree").setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
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
