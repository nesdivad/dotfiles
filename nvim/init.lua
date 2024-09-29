local vim = vim
local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.tabstop = 4
vim.shiftwidth = 4
vim.opt.termguicolors = true

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')

vim.call('plug#end')

require("nvim-tree").setup()

require("keymap")
