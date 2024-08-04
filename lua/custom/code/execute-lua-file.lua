-- TODO: make it ftplugin or something, so it's only for lua files
vim.keymap.set('n', '<leader>x', ':source %<cr>', { desc = 'execute lua file', silent = true })
