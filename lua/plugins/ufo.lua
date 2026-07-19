return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    -- General folding options
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- A large value for using the UFO provider
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    -- Native treesitter fold expression (replaces the legacy nvim_treesitter#foldexpr())
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- UFO setup
    require('ufo').setup({
        fold_hl = {
            -- Folded lines
            "Folded",
            -- Fold column
            "FoldColumn",
        },
        -- Other UFO options
        provider_selector = function(bufnr, filetype, buftype)
            return {"treesitter", "indent"}
        end
    })

    -- Keymaps for opening/closing folds
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
}
