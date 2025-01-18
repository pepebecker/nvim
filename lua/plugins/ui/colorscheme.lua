return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "macchiato",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay1 },
          Visual = { bg = colors.overlay1 },
        }
      end,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      dim_inactive = true,
      lualine_bold = true,
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
      background_clear = {
        "float_win",
        "toggleterm",
        "telescope",
        "which-key",
        "renamer",
        "notify",
        "neo-tree",
        "bufferline",
      },
    },
  },
  {
    "zaldih/themery.nvim",
    enabled = true,
    opts = {
      themes = {
        "tokyonight-moon",
        "tokyonight-storm",
        "catppuccin-macchiato",
        "catppuccin-mocha",
        "solarized-osaka",
        "monokai-pro",
      },
      livePreview = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-moon",
      colorscheme = "catppuccin-macchiato",
    },
  },
}
