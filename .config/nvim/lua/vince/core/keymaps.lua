function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map <Space> to be the leader key
vim.g.mapleader = ' '

-- In visual mode J,K to move the select lines down or up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode when the next line is moved to the back of the current line, remain the cursor at the current position
map("n", "J", "mzJ`z")

-- When pasting copied word, remain the copied word in buffer
map("x", "<Leader>p", "\"_dP")

-- For telescope
local builtin = require('telescope.builtin')

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
-- map("n", "<Leader>", ":<C-u>WhichKey ','<CR>", { silent = true })
map("n", "<Leader>e", ":NvimTreeToggle ','<CR>", { silent = true })
-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true })
-- map("n", "<Leader>?", ":WhichKey ','<CR>")
