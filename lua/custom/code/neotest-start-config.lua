require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      dap = { justMyCode = false },
    },
    require 'neotest-gtest',
    require 'neotest-plenary',
    require 'neotest-vim-test' {
      ignore_file_types = { 'python', 'vim', 'lua', 'cpp' },
    },
    require('neotest-gtest').setup {
      is_test_file = function(filename)
        return vim.endswith(filename, '.cpp')
      end,
    },
  },
}
