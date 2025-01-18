-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-a>", "<Esc>ggVG", { desc = "Select All" })

-- Splits
vim.keymap.set("n", "<leader>we", "<cmd>vsplit<cr>", { desc = "Split window vertically" }) -- split vertically

-- Make Run
vim.keymap.set("n", "<leader>mm", "<cmd>!make<cr>", { desc = "Make" })
vim.keymap.set("n", "<leader>mr", "<cmd>!make run<cr>", { desc = "Make Run" })
vim.keymap.set("n", "<leader>mt", "<cmd>!make test<cr>", { desc = "Make Test" })
vim.keymap.set("n", "<leader>mc", "<cmd>!make clean<cr>", { desc = "Make Clean" })
