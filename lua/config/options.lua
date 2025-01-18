-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.conceallevel = 2

-- Configure tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Configure scroll speed
vim.opt.mousescroll = "ver:2,hor:4"

-- Make cmp background transparent
vim.opt.pumblend = 0

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

-- Eva
vim.filetype.add({
  extension = {
    eva = "eva",
  },
})
