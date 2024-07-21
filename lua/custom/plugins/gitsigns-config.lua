return {
  'lewis6991/gitsigns.nvim',
  cmd = { 'Gitsigns' },
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
  },
  keys = {
    {
      ']c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          require('gitsigns').nav_hunk 'next'
        end
      end,
      mode = 'n',
      desc = 'Gitsigns next hunk',
    },
    {
      '[c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          require('gitsigns').nav_hunk 'prev'
        end
      end,
      mode = 'n',
      desc = 'Previous hunk',
    },
    {
      '<leader>hs',
      require('gitsigns').stage_hunk,
      mode = 'n',
      desc = 'Stage hunk',
    },
    {
      '<leader>hr',
      require('gitsigns').reset_hunk,
      mode = 'v',
      desc = 'Reset hunk',
    },
    {
      '<leader>hs',
      require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' },
      mode = 'v',
      desc = 'Stage hunk',
    },
    {
      '<leader>hr',
      require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' },
      mode = 'v',
      desc = 'Stage hunk',
    },
    {
      '<leader>hS',
      require('gitsigns').stage_buffer,
      mode = 'n',
      desc = 'Stage buffer',
    },
    {
      '<leader>hu',
      require('gitsigns').undo_stage_hunk,
      mode = 'n',
      desc = 'Undo stage hunk',
    },
    {
      '<leader>hR',
      require('gitsigns').reset_buffer,
      mode = 'n',
      desc = 'Reset buffer',
    },
    {
      '<leader>hp',
      require('gitsigns').preview_hunk,
      mode = 'n',
      desc = 'Preview hunk',
    },
    {
      '<leader>hb',
      require('gitsigns').blame_line { full = true },
      mode = 'n',
      desc = 'Blame line',
    },
    {
      '<leader>tb',
      require('gitsigns').toggle_current_line_blame,
      mode = 'n',
      desc = 'Toggle blame line',
    },
    {
      '<leader>hd',
      require('gitsigns').diffthis,
      mode = 'n',
      desc = 'Diff this',
    },
    {
      '<leader>hD',
      require('gitsigns').diffthis '~',
      mode = 'n',
      desc = 'Diff this tilda ?',
    },
    {
      '<leader>td',
      require('gitsigns').toggle_deleted,
      mode = 'n',
      desc = 'Toggle deleted',
    },
    {
      ':<C-U>Gitsigns select_hunk<CR>',
      desc = 'Diff this',
    },
  },
}
