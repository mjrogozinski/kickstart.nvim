-- without specifying bufnr, keymaps are available in other buffers
local bufnr = vim.api.nvim_get_current_buf()

function WithDesc(description)
  return { noremap = true, silent = true, buffer = bufnr, desc = description }
end

vim.keymap.set('n', '<leader>x', ':source %<cr>', WithDesc 'execute lua file')
vim.keymap.set('n', '<leader>X', ':lua require"osv".run_this()<cr>', WithDesc 'debug lua file (breakpoint required!)')
