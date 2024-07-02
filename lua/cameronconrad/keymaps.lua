vim.keymap.set('n', '<leader>R', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- Keymap to exit out of a file  
vim.keymap.set('n', '-', ':Ex<CR>', { noremap = true, silent = false })
