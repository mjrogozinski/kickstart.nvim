-- it probaby should be in filetype something
vim.keymap.set('n', '<leader>o', ':ClangdSwitchSourceHeader<CR>', { silent = true, desc = 'switch header-source' })
vim.keymap.set('n', '<F4>', ':ClangdSwitchSourceHeader<CR>', { silent = true, desc = 'switch header-source' })
