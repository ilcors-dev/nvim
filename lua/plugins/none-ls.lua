-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier.with {
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "html",
          "css",
          "json",
          "tsx",
          "jsx",
        },
      },
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.phpcsfixer.with {
        filetypes = { "php" },
        command = vim.fn.stdpath "data" .. "/mason/packages/php-cs-fixer/php-cs-fixer",
        args = {
          "--rules=@PSR12", -- Use PSR12 rules
          "--config=.php-cs-fixer.php,.php-cs-fixer.dist.php,.php_cs,.php_cs.dist", -- Config file priorities
          "--allow-risky=no", -- Disallow risky rules
          "--path-mode=override", -- Override paths
          "--parallel",
        },
        extra_args = function(params)
          -- Add any extra arguments if needed, based on the file or project
          return {}
        end,
      },
    })
  end,
}
