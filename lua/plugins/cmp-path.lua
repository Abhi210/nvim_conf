return {
  'hrsh7th/cmp-path',
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = cmp.config.sources({
        { name = 'path' },
      }),
    })
  end,
}
