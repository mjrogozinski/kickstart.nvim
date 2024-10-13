return {
  'gbprod/yanky.nvim',
  opts = {
    highlight = {
      timer = 150,
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    -- Yanky put mappings
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' } },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' } },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' } },

    -- Yanky previous/next entry mappings
    { '<c-p>', '<Plug>(YankyPreviousEntry)', mode = 'n' },
    { '<c-n>', '<Plug>(YankyNextEntry)', mode = 'n' },
  },
}
