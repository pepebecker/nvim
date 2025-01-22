return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      ds_pinyin_lsp = {
        init_options = {
          db_path = "/Users/pepe/.local/src/ds-pinyin-lsp/dict.db3",
        },
      },
      sourcekit = {},
    },
  },
}
