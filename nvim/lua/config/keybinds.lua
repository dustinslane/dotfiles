local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
----------------------------------------------------
--- Telescop
----------------------------------------------------
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


----------------------------------------------------
--- NeoTree
----------------------------------------------------

map('n', '\\', '<Cmd>Neotree toggle position=left<CR>', opts)

----------------------------------------------------
--- BAR BAR
----------------------------------------------------

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>', opts)
map('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLineGoToBuffer 10<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferLineTogglePin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufDel<CR>', opts)
