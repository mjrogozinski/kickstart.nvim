local ht = require 'haskell-tools'
local bufnr = vim.api.nvim_get_current_buf()

function WithDesc(description)
  return { noremap = true, silent = true, buffer = bufnr, desc = description }
end

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<leader>xc', vim.lsp.codelens.run, WithDesc 'Codelens run')
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<leader>K', ht.hoogle.hoogle_signature, WithDesc 'Hoogle signature')
-- Evaluate all code snippets
vim.keymap.set('n', '<leader>xa', ht.lsp.buf_eval_all, WithDesc 'Evaluate all code snippets')
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>xr', ht.repl.toggle, WithDesc 'Toggle repl for current package')
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>xf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, WithDesc 'Toggle repl in current buffer')
vim.keymap.set('n', '<leader>xq', ht.repl.quit, WithDesc 'Quit repl')
