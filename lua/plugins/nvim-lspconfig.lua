-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    {
      "williamboman/mason.nvim",
    },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim" },

    -- Auto-Install LSPs, linters, formatters, debuggers
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { "folke/neodev.nvim" },
    {
      "jay-babu/mason-null-ls.nvim",
      -- overrides `require("mason-null-ls").setup(...)`
      opts = {
        ensure_installed = {
          "stylua",
          "php-cs-fixer", -- PHP formatter
          "prettier", -- Prettier for JavaScript/TypeScript
          "eslint_d", -- ESLint for linting
        },
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = {
        ensure_installed = {
          "python",
          -- add more arguments for adding more debuggers
        },
      },
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls", -- LUA
        "jsonls", -- JSON
        "yamlls", -- YAML
        "ts_ls", -- TypeScript/JavaScript
        "volar", -- Vue
        "gopls", -- Go
        "rust_analyzer", -- Rust
        "pyright", -- Python
        "intelephense", -- PHP
        "bashls",
        "cssls",
        "html",
        "zls", -- Zig
      },
      automatic_installation = true,
    }

    local lspconfig = require "lspconfig"
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        }
      end,
      ["zls"] = function()
        lspconfig.zls.setup {
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        }
      end,
    }

    lspconfig.rust_analyzer.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(client, bufnr) 
        local opts = { noremap=true, silent=true, buffer=bufnr }

        vim.lsp.inlay_hint.enable(true)

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = {
            command = "clippy",
            allFeatures = true,
          },
        },
      },
    }

    -- Add diagnostic configuration here
    vim.diagnostic.config {
      virtual_text = {
        prefix = "●", -- Choose a prefix
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }
  end,
}
