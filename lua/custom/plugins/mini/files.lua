return {
  'echasnovski/mini.files',
  version = false,
  keys = {
    {
      '<leader>e',
      function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end,
      mode = '',
      desc = '[e]xplorer',
    },
  },
  opts = {},
}
