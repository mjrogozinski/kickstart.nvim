return {
  'nvimdev/lspsaga.nvim',
  opts = {},
  keys = {
    {
      '<leader>cA',
      '<cmd>Lspsaga code_action<CR>',
      mode = '',
      desc = 'lspsaga code action',
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
