return {
  'gabrielpoca/replacer.nvim',
  opts = { rename_files = false },
  keys = {
    {
      '<leader>cr',
      function()
        require('replacer').run()
      end,
      desc = 'quickfix replacer',
    },
  },
}
