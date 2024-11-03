return {
  'gabrielpoca/replacer.nvim',
  opts = { rename_files = false },
  keys = {
    {
      '<leader>cq',
      function()
        require('replacer').run()
      end,
      desc = 'quickfix replacer',
    },
  },
}
