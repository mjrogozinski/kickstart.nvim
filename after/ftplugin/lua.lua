local in_current_buffer = require 'custom.code.utils.buf-key-map'

vim.keymap.set('n', '<leader>x', ':source %<cr>', in_current_buffer.with_desc 'execute lua file')
vim.keymap.set('n', '<leader>X', ':lua require"osv".run_this()<cr>', in_current_buffer.with_desc 'debug lua file (breakpoint required!)')
