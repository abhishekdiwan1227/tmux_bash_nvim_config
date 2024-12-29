vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-d>c', ':q<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<S-d>s', ':q!<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<S-d>n', ':noh<CR>', { noremap = true, silent = false })
