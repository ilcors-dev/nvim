return {
  "lukas-reineke/virt-column.nvim",
  event = "BufReadPre",
  config = function()
    require("virt-column").setup {
      char = "│", -- Character for the vertical column
      virtcolumn = "120", -- Position the column at character 80
    }
  end,
}
