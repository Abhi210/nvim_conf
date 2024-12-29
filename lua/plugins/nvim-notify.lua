return {
  "rcarriga/nvim-notify",
  config = function()
    -- Optional configuration for nvim-notify if needed
    vim.notify = require("notify")
  end,
}
