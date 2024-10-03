-- at the moment I don't know how to do it better
-- there should be a way to add bindings using overseer's API
vim.keymap.set('n', '<leader>cb', function()
  require('overseer').run_template { name = 'cmake build' }
end, {
  silent = true,
  desc = 'cmake build',
})
