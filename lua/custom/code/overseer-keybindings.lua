-- another option is :OverseerRun cmake\ build
vim.keymap.set('n', '<leader>cb', function()
  require('overseer').run_template { name = 'cmake build' }
end, {
  silent = true,
  desc = 'cmake build',
})
