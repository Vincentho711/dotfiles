-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>", { desc = "Exit" })

-- In visual mode, J, K to move the selected lines up or down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- Stay in indent mode after indent
map("v", "<", "<gv", { desc = "Indent to the left" })
map("v", ">", ">gv", { desc = "Indent to the right" })

-- Copy the absoute file path of the current buffer
map("n", "<leader>bY", "<cmd>let @+ = expand('%p')<cr>", { desc = "Copy the current buffer's absolute file path" })

--Mapping for leap.nvim
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
map({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)", { desc = "Leap from window" })
