return {
  'ojroques/nvim-osc52',
  opts = {},
  config = function()
    -- why you no executingggg
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
      return { vim.fn.split(vim.fn.getreg '', '\n'), vim.fn.getregtype '' }
    end

    vim.g.clipboard = {
      name = 'osc52',
      copy = { ['+'] = copy, ['*'] = copy },
      paste = { ['+'] = paste, ['*'] = paste },
    }
  end,
  keys = {
    {
      '<leader>c',
      '"+y',
      mode = 'n',
      desc = 'copy to system clipboard',
    },
    -- { '<leader>cc', '"+yy', mode = 'n', desc = 'copy to system clipboard 2' },
  },
}
