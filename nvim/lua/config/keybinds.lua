local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

----------------------------------------------------
--- Telescope
----------------------------------------------------
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

----------------------------------------------------
--- NeoTree
----------------------------------------------------

map("n", "\\", "<Cmd>Neotree toggle position=left<CR>", opts)

----------------------------------------------------
--- BUFFERLINE
----------------------------------------------------

-- Move to previous/next
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", opts)
map("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLineGoToBuffer 10<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferLineTogglePin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufDel<CR>", opts)

----------------------------------------------------
--- STYLUA
----------------------------------------------------
map("n", "<C-f>", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)

----------------------------------------------------
--- DEFINITELY NOT STOLEN FROM LAZYGIT
----------------------------------------------------


map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window"   })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })


map( "n", "gI", [[ <cmd>lua require("telescope.builtin").lsp_implementations({ reuse_win = true })<CR>]], {desc = "Goto Implementation"})
map( "n", "gr", "<cmd>Telescope lsp_references<cr>", {desc = "Goto Implementation", nowait = true})
map( "n", "gd", [[ <cmd>lua require("telescope.builtin").lsp_definitions({ reuse_win = true })<CR>]], {desc = "Goto Definition"})
