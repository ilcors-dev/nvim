local opts = {}

function OpenHtmlPreview()
  local file_path = vim.fn.expand "%:p" -- Get the full path of the current file
  if string.match(file_path, "%.html$") then
    -- Check if the file is an HTML file
    os.execute(string.format('open "%s"', file_path)) -- For macOS
  else
    print "Not an HTML file!"
  end
end

vim.opt.mouse = ""
vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

local wk = require "which-key"

wk.add {
  { "<leader>a", group = "Actions" }, -- Top-level group
  { "<leader>ah", group = "HTML" }, -- Subgroup for HTML
  { "<leader>aho", "<cmd>lua OpenHtmlPreview()<CR>", desc = "Open in Browser" },
  {},
}
