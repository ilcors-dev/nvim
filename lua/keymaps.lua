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

-- Enable mouse only in terminal mode
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function() vim.opt.mouse = "a" end,
})

vim.api.nvim_create_autocmd("TermLeave", {
  callback = function() vim.opt.mouse = "" end,
})

vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

local wk = require "which-key"

wk.add {
  { "<leader>a", group = "Actions" }, -- Top-level group
  { "<leader>ah", group = "HTML" }, -- Subgroup for HTML
  { "<leader>aho", "<cmd>lua OpenHtmlPreview()<CR>", desc = "Open in Browser" },
  { "<leader>as", group = "Current File" },
  { "<leader>ash", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Show Signature Help" }, -- Trigger LSP Signature Help
  {
    "<leader>asi",
    "<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } } })<CR>",
    desc = "Organize Imports (Remove Unused and Sort)",
  }, -- Organize Imports command
  {
    "<leader>ad",
    function()
      local float_wins = vim.api.nvim_list_wins()
      for _, win in ipairs(float_wins) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" and config.focusable then
          -- Close existing floating diagnostic popup
          vim.api.nvim_win_close(win, true)
          return
        end
      end

      -- Open the diagnostic popup if none are active
      local opts = { focusable = false, scope = "cursor" } -- Scope can be "line" or "cursor"
      vim.diagnostic.open_float(nil, opts)
    end,
    desc = "Toggle Diagnostics Popup",
  },
  {
    "<leader>ac",
    function()
      local diagnostics = vim.diagnostic.get(0) -- Get diagnostics for the current buffer
      local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
      local row = cursor_pos[1] - 1 -- Convert to 0-based indexing

      -- Find the first diagnostic at the cursor's row
      for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.lnum == row then
          -- Copy diagnostic message to the clipboard
          vim.fn.setreg("+", diagnostic.message)
          vim.notify("Copied diagnostic: " .. diagnostic.message, vim.log.levels.INFO)
          return
        end
      end

      -- Notify if no diagnostic is found
      vim.notify("No diagnostic found at cursor position", vim.log.levels.WARN)
    end,
    desc = "Copy Diagnostic to Clipboard",
  },
  { "<leader>t", group = "Terminal" },
  { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
}
