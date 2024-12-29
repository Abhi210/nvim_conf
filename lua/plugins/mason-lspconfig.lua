-- ~/.config/nvim/lua/plugins/lspconfig.lua
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "folke/neodev.nvim", opts = {} },
        "ray-x/lsp_signature.nvim",
        -- Add these for better documentation display
        { "folke/neodev.nvim", opts = {} },
        {
            "dnlhc/glance.nvim",
            config = function()
                require('glance').setup({
                    -- Config options
                    preview_win_opts = {
                        wrap = true,
                        number = true,
                    },
                })
            end,
        },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        
        -- Configure how documentation is displayed
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                -- Make the hover window larger
                max_width = 80,
                max_height = 30,
                -- Show border
                border = "rounded",
            }
        )

        -- Enhanced signature help configuration
        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                border = "rounded"
            },
            hint_enable = true,
            hint_prefix = "🔍 ",
            max_width = 80,
            max_height = 30,
            toggle_key = '<C-k>', -- Press Ctrl+k to toggle signature
            doc_lines = 10, -- Show more lines of docs
            floating_window = true, -- Show docs in floating window
            floating_window_above_cur_line = true,
            -- Show more context in the documentation
            extra_trigger_chars = {"(", ","},
            -- Show parameter documentation
            parameter_hints_prefix = "󰆧 ",
            hint_scheme = "String",
        })

        local on_attach = function(client, bufnr)
            -- Other keybindings remain the same
            local opts = { noremap = true, silent = true, buffer = bufnr }
            
            -- Enhanced documentation viewing
            vim.keymap.set('n', 'K', function()
                -- Show hover documentation
                vim.lsp.buf.hover()
            end, opts)
            
            -- Show signature help when inside parentheses
            vim.keymap.set('i', '<C-k>', function()
                require('lsp_signature').signature()
            end, opts)
        end

        -- Pyright configuration with enhanced documentation
      --  nvim_lsp.pyright.setup({
      --      on_attach = on_attach,
      --      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --      settings = {
      --          python = {
      --              analysis = {
      --                  autoSearchPaths = true,
      --                  diagnosticMode = "workspace",
      --                  useLibraryCodeForTypes = true,
      --                  typeCheckingMode = "basic",
      --                  stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
      --              },
      --          },
      --      },
      --      -- Add this for better docstring support
      --      on_init = function(client)
      --          client.server_capabilities.signatureHelpProvider = {
      --              triggerCharacters = {"(", ","}
      --          }
      --          return true
      --      end,
      --  })

      -- Add this to your LSP config
        nvim_lsp.jedi_language_server.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                completion = {
                    disableSnippets = false,
                    resolveEagerly = true,
                    ignorePatterns = {},
                },
                diagnostics = {
                    enable = true,
                    didOpen = true,
                    didChange = true,
                    didSave = true,
                },
                hover = {
                    enable = true,
                    disable = {},
                },
                workspace = {
                    symbols = {
                        maxSymbols = 20,
                    },
                    environment = nil,  -- Use default Python environment
                },
                markupKindPreferred = "markdown",  -- Show documentation in markdown format
            },
        })
    end,
}
