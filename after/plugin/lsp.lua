require('neodev').setup {}
require('mason').setup()
require('mason-lspconfig').setup {
   ensure_installed = {
      'clangd',
      'lua_ls',
      'rust_analyzer',
   },
}
require('lspconfig').clangd.setup {}
require('lspconfig').rust_analyzer.setup {}

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  -- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  -- vim.keymap.set('n', 'gR', require('telescope.builtin').lsp_references, { prompt_prefix = '🔍 ' })
  -- vim.keymap.set('n', 'gF', vim.lsp.buf.formatting, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = {
        -- library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

