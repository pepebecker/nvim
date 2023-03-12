require('toggleterm').setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    }
  }
})

local Terminal  = require('toggleterm.terminal').Terminal

local node    = Terminal:new({ cmd = 'node', hidden = true })
local deno    = Terminal:new({ cmd = 'deno', hidden = true })
local python  = Terminal:new({ cmd = 'python3', hidden = true })
local lua     = Terminal:new({ cmd = 'lua', hidden = true })
local raku    = Terminal:new({ cmd = 'raku', hidden = true })
local ghci    = Terminal:new({ cmd = 'ghci', hidden = true })
local cmatrix = Terminal:new({ cmd = 'cmatrix', hidden = true })

vim.keymap.set('n', '\\n', ':lua NODE_TERM()<CR>') 
vim.keymap.set('n', '\\d', ':lua DENO_TERM()<CR>')
vim.keymap.set('n', '\\p', ':lua PYTHON_TERM()<CR>')
vim.keymap.set('n', '\\l', ':lua LUA_TERM()<CR>')
vim.keymap.set('n', '\\r', ':lua RAKU_TERM()<CR>')
vim.keymap.set('n', '\\g', ':lua GHC_TERM()<CR>')
vim.keymap.set('n', '\\c', ':lua CMATRIX_TERM()<CR>')

function NODE_TERM()
  node:toggle()
end

function DENO_TERM()
  deno:toggle()
end

function PYTHON_TERM()
  python:toggle()
end

function LUA_TERM()
  lua:toggle()
end

function RAKU_TERM()
  raku:toggle()
end

function GHC_TERM()
  ghci:toggle()
end

function CMATRIX_TERM()
  cmatrix:toggle()
end

