vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.showtabline = 2
vim.opt.filetype = "on"

require('config.lazy');
require('keymaps')
require('langsupport')
require('autocmds')

vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.highlight "Normal guibg=black guifg=white"
