vim.api.nvim_create_user_command("MarkdownToPdf", function()
  local input_file = vim.fn.expand "%:p"
  local output_file = vim.fn.expand "%:p:r" .. ".pdf"
  vim.cmd("!pandoc " .. input_file .. " -o " .. output_file .. "--pdf-engine=xelatex")
end, {})
