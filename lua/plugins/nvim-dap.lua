return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- UI for nvim-dap
    "jay-babu/mason-nvim-dap.nvim", -- Mason integration
  },
  config = function()
    local dap = require "dap"

    -- Configure LLDB for Rust
    dap.adapters.lldb = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
      name = "lldb",
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file") end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.listeners.after.event_initialized["enable_mouse"] = function()
      vim.opt.mouse = "a"
      print "Mouse enabled for debugging"
    end

    dap.listeners.before.event_terminated["disable_mouse"] = function()
      vim.opt.mouse = ""
      print "Mouse disabled after debugging"
    end

    dap.listeners.before.event_exited["disable_mouse"] = function()
      vim.opt.mouse = ""
      print "Mouse disabled after debugging"
    end

    -- Setup DAP UI
    require("dapui").setup()
    vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Start Debugging" })
    vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
    vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
    vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })
    vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
  end,
}
