return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "\\", "<cmd>Neotree reveal<CR>", { desc = "NeoTree" } },
  },
  opts = {
    popup_border_style = "rounded",
    filesystem = {
      window = {
        position = "float",
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
