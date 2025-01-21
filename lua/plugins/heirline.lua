return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- Add terminal information provider to the default statusline
    table.insert(opts.statusline, {
      provider = function()
        local terminals = require("toggleterm.terminal").get_all()
        if #terminals == 0 then return "No terminals" end
        local terminal_list = {}
        for _, term in pairs(terminals) do
          table.insert(terminal_list, "t" .. term.id)
        end
        return "Terms open: " .. table.concat(terminal_list, " | ")
      end,
      hl = { fg = "green", bold = true }, -- Highlight for terminal info
    })
  end,
}
