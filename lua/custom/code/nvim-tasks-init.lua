local Path = require 'plenary.path'
--- chat gpt
-- Function to check if a given directory contains the "build" folder
function Contains_build_folder(dir)
  local build_path = dir .. '/build'
  local file = io.open(build_path, 'r')
  if file then
    file:close()
    return true
  else
    return false
  end
end

-- Function to get the first parent directory containing the "build" folder
function Find_build_directory(cwd)
  local function get_parent_directory(path)
    local parent_dir = path:match '(.*)/[^/]*$'
    return parent_dir
  end

  local current_dir = cwd
  while current_dir and current_dir ~= '' do
    if Contains_build_folder(current_dir) then
      return current_dir .. '/build'
    end
    current_dir = get_parent_directory(current_dir)
  end
  return nil -- Return nil if no such directory is found
end
--- /chat gpt

require('tasks').setup {
  default_params = { -- Default module parameters with which `neovim.json` will be created.
    cmake = {
      cmd = 'cmake', -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
      build_dir = Find_build_directory(vim.fn.getcwd()), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
      build_type = 'Debug', -- Build type, can be changed using `:Task set_module_param cmake build_type`.
      dap_name = 'codelldb', -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
      args = { -- Task default arguments.
        configure = {
          '-D',
          'CMAKE_EXPORT_COMPILE_COMMANDS=1',
          '-G',
          'Ninja',
        },
      },
    },
  },
  save_before_run = true, -- If true, all files will be saved before executing a task.
  params_file = 'neovim.json', -- JSON file to store module and task parameters.
  quickfix = {
    pos = 'botright', -- Default quickfix position.
    height = 12, -- Default height.
  },
  dap_open_command = function()
    return require('dap').repl.open()
  end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
}

vim.keymap.set('n', '<c-b>', ':Task start cmake build_all<CR>', { silent = true, desc = 'Cmake build all' })
vim.keymap.set('n', '<leader>cb', ':Task start cmake build_all<CR>', { silent = true, desc = '[C]make [b]uild all' })
vim.keymap.set('n', '<leader>cl', ':cclose<CR>', { silent = true, desc = '[C][l]ose quickfix list' })
