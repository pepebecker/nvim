local query = vim.treesitter.query
local files = nil

local fix_indentation = function(str, min_spaces)
  if min_spaces == nil then
    min_spaces = 1000
  end

  for spaces in string.gmatch(str, '\n([ \t]+)') do
    if min_spaces > #spaces then
      min_spaces = #spaces
    end
  end

  local pattern = '\n'
  pattern = pattern .. string.rep('[ \t]', min_spaces)

  local indented = string.gsub(str, pattern, '\n')
  return indented
end

local save_into_files = function()
  local out = 'Exported into files: '
  for filename, code_blocks in pairs(files) do
    -- Without expanding the file will be nil
    local file = io.open(vim.fn.expand(filename), 'w+')
    io.output(file)
    for _, block in ipairs(code_blocks) do
      io.write(block .. '\n\n')
    end
    io.close(file)
    out = out .. filename .. ' '
  end
  print(out)
end

-- necessary for recursion in this case
local process_node = nil
process_node = function(node, cur_file)
  if node == nil then
    return
  end

  for subnode in node:iter_children() do
    local t = subnode:type()
    -- If the node is a block, try to tangle if necessary
    if t == 'block' then
      if cur_file ~= nil then
        if files[cur_file] == nil then
          files[cur_file] = {}
        end

        for block_prop in subnode:iter_children() do
          if block_prop:type() == 'contents' then
            local _, col = block_prop:range()
            table.insert(files[cur_file], fix_indentation(query.get_node_text(block_prop, 0), col))
          end
        end
      end
      -- It was necessary to start from property_drawer, in order to
      -- pass "cur_file" to the node inside the section body
    elseif t == 'property_drawer' then
      for drawer_child in subnode:iter_children() do
        if drawer_child:type() == 'property' then
          local is_tangle = false
          -- Look for the property name and value
          for prop_part in drawer_child:iter_children() do
            local prop_type = prop_part:type()
            local prop_text = query.get_node_text(prop_part, 0)
            if prop_type == 'expr' and prop_text == 'TANGLE' then
              is_tangle = true
            elseif prop_type == 'value' and is_tangle then
              cur_file = prop_text
              is_tangle = false
            end
          end
        end
      end
    else
      process_node(subnode, cur_file)
    end
  end
end

local tangle = function()
  files = {}

  local language_tree = vim.treesitter.get_parser(0)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  process_node(root, nil)
  save_into_files()
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'org',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ot', '', {
      callback = function()
        tangle()
      end,
      noremap = true
    })
  end
})

