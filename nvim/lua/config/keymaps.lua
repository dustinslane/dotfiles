-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local largs = require('telescope').extensions.live_grep_args;

vim.keymap.set("n", "<leader>sg", largs.live_grep_args, { desc = "GREP (Args)" })
vim.keymap.set("n", "<F2>", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true})
