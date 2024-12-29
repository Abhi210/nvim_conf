return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    -- General folding options
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- A large value for using the UFO provider
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- UFO setup
    require('ufo').setup()

    -- Keymaps for opening/closing folds
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    -- Extend LSP capabilities for folding
    local lsp_capabilities = vim.tbl_deep_extend(
      'force',
      require('cmp_nvim_lsp').default_capabilities(),
      {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      }
    )

    -- Merge the folding capabilities with LSP defaults
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      lsp_capabilities
    )
  end,
}

