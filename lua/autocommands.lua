vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.qak",
  callback = function()
    local current_path = vim.fn.expand "%:p:h"
    -- remove any it.unibo.* folders
    local command = "rm -rf " .. current_path .. "/it*"
    print "Removing it.unibo.* folders"
    os.execute(command)

    local file = vim.fn.expand "%:p" -- Full path of the current file
    command = "java -jar /Users/ilcors-dev/Desktop/qak/it.unibo.Qactork_1.5.6.jar " .. file
    print("Generating Kotlin files for: " .. file)
    os.execute(command)
  end,
})
