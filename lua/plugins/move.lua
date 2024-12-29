return {
  "fedepujol/move.nvim",
  config = function()
    -- Initialize Move.nvim
    require("move").setup()

    -- Keybinding options
    local opts = { noremap = true, silent = true }

    -- Normal Mode: Move current line
    vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)  -- Move line down
    vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts) -- Move line up

    -- Visual Mode: Move selected block
    vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)  -- Move block down
    vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts) -- Move block up

    -- Normal Mode: Move current line horizontally
    vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts) -- Move character left
    vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)  -- Move character right

    -- Visual Mode: Move selected block horizontally
    vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts) -- Move block left
    vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)  -- Move block right
  end,
}

