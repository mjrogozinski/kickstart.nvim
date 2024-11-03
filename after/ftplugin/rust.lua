local in_current_buffer = require 'custom.code.utils.buf-key-map'

vim.keymap.set('n', '<leader>ct', function()
  vim.cmd.RustLsp { 'testables', bang = false }
  vim.cmd 'wincmd w'
end, in_current_buffer.with_desc 'RustTest!')

local function switch_to_previous_split()
  vim.defer_fn(function()
    vim.cmd 'wincmd w'
  end, 100)
end

vim.keymap.set('n', '<leader>x', function()
  vim.cmd.RustLsp 'run'
  switch_to_previous_split()
end, in_current_buffer.with_desc 'Rust run')

vim.keymap.set('n', '<leader>X', function()
  vim.cmd.RustLsp 'debug'
end, in_current_buffer.with_desc 'Rust debug')
