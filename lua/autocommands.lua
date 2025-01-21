vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.qak",
  callback = function()
    local file = vim.fn.expand "%:p" -- Full path of the current file
    local command = "java -jar /Users/ilcors-dev/Desktop/qak/it.unibo.Qactork_1.5.6.jar " .. file
    print("Generating Kotlin files for: " .. file)
    os.execute(command)
  end,
})
