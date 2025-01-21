return {
  require("toggleterm").setup {
    open_mapping = [[<C-\>]], -- Shortcut to toggle terminal
    direction = "float", -- Default terminal direction
    size = 15, -- Adjust terminal size
    scrollback = 10000, -- Set scrollback buffer size
    on_open = function(term)
      vim.cmd "startinsert" -- Automatically enter insert mode when opening
    end,
    on_close = function(term)
      vim.cmd "stopinsert" -- Exit insert mode when closing
    end,
  },

  -- Key mappings to manage multiple terminals
  vim.keymap.set("n", "<leader>t1", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local term1 = Terminal:new { direction = "float", id = 1 }
    term1:toggle()
  end, { desc = "Toggle terminal 1" }),

  vim.keymap.set("n", "<leader>t2", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local term2 = Terminal:new { direction = "float", id = 2 }
    term2:toggle()
  end, { desc = "Toggle terminal 2" }),

  vim.keymap.set("n", "<leader>t3", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local term3 = Terminal:new { direction = "float", id = 3 }
    term3:toggle()
  end, { desc = "Toggle terminal 3" }),

  -- List all open terminals
  vim.keymap.set("n", "<leader>tl", function()
    local terminals = require("toggleterm.terminal").get_all()
    if vim.tbl_isempty(terminals) then
      vim.notify("No open terminals", vim.log.levels.INFO)
    else
      local terminal_list = "Open terminals:\n"
      for _, term in pairs(terminals) do
        terminal_list = terminal_list .. "ID: " .. term.id .. " (" .. term.direction .. ")\n"
      end
      vim.notify(terminal_list, vim.log.levels.INFO)
    end
  end, { desc = "List all open terminals" }),

  -- Use Telescope to switch between terminal buffers
  vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", { desc = "Switch between terminal buffers" }),
}
