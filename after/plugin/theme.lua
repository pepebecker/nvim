-- require('rose-pine').setup({
--   disable_background = true,
--   disable_float_background = true,
-- })
-- vim.cmd('colorscheme rose-pine')

require('tokyonight').setup({
  transparent = true,
  terminal_colors = true,
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },
})
vim.cmd('colorscheme tokyonight')
