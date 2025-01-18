return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "/Users/pepe/Documents/Neorg/notes",
            korean = "/Users/pepe/Documents/Neorg/korean",
          },
        },
      },
    },
  },
}
