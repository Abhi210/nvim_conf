-- Manual venv override. pyright already auto-detects .venv/venv/env and $VIRTUAL_ENV
-- (see plugins/mason-lspconfig.lua); use ,v when the venv lives somewhere else.
-- The selection is cached per project root and reactivated on later sessions.
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
  },
  ft = "python", -- Load when opening Python files
  keys = {
    { ",v", "<cmd>VenvSelect<cr>", desc = "Select Venv" }, -- Open picker on keymap
  },
  opts = {
    search = {}, -- if you add your own searches, they go here.
    options = {
      picker = "auto",
    },
  },
}
