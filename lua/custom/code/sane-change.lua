local function set_paste_inside_binding_for(textobject)
  vim.keymap.set({ 'n', 'v' }, '<leader>p' .. textobject, '"_di' .. textobject .. 'P', { desc = 'paste over ' .. textobject })
end

set_paste_inside_binding_for 'w'
set_paste_inside_binding_for 'W'
set_paste_inside_binding_for '"'
set_paste_inside_binding_for "'"
set_paste_inside_binding_for '('
set_paste_inside_binding_for ')'
set_paste_inside_binding_for '['
set_paste_inside_binding_for ']'
set_paste_inside_binding_for '<'
set_paste_inside_binding_for '>'
set_paste_inside_binding_for '{'
set_paste_inside_binding_for '}'

-- this is a chatgpt-generated prototype
-- I have to add unit tests and implement it propertly
-- the idea is to just have q to match anything with 'inside'
-- and paste over the most outer the cursor is inside of
--
vim.keymap.set('n', '<leader>pq', function()
  local textobjects = { '{', '(', '[', '<', "'", '"' }

  for _, char in ipairs(textobjects) do
    local ok = pcall(function()
      vim.cmd('normal! "_di' .. char .. 'P')
    end)
    if ok then
      return
    end
  end

  print 'No surrounding pair found.'
end, { desc = 'Replace inside surrounding quotes/brackets with clipboard' })
