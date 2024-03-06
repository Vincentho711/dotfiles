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
local telescope_builtin = require('telescope.builtin')

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
-- map("n", "<Leader>", ":<C-u>WhichKey ','<CR>", { silent = true })
map("n", "<Leader>e", ":NvimTreeToggle ','<CR>", { silent = true })
-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true })
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true })
-- map("n", "<Leader>?", ":WhichKey ','<CR>")

-- For Gitsigns
local gitsigns = require('gitsigns')
map("n", "<Leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { silent = true })
map("n", "<Leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { silent = true })
map("n", "<Leader>hp", "<cmd>Gitsigns preview_hunk<cr>", { silent = true })
map("n", "<Leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { silent = true })
map("n", "<Leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { silent = true})
map("n", "<Leader>hd", "<cmd>Gitsigns diffthis<cr>", { silent = true })
map("n", "<Leader>td", "<cmd>Gitsigns toggle_deleted<cr>", { silent = true })

-- For Neogen
local neogen = require('neogen')
map("n", "<Leader>ng", "<cmd>Neogen<cr>", { silent = true})
