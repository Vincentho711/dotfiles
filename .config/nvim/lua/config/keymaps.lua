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

-- Function to open the p4 diff in a new toggleterm instance, requires perforce to be installed
function _p4_diff_in_toggleterm()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand("%p")

  -- Create a new terminal window each time (this prevents reuse of the old terminal)
  local terminal = require("toggleterm.terminal").Terminal:new({
    cmd = "p4 diff" .. current_file, -- The command to run in the terminal
    hidden = true, -- Start hidden
    direction = "float", -- Use a floating terminal
    close_on_exit = false, -- Keep terminal open afer command completes
    count = nil, -- Don't bind it to a specific terminal count (create a new terminal each time)
  })

  -- Open the terminal (this opens a new terminal each time)
  terminal:toggle()
end

-- Function to execute 'p4 edit' on the current buffer, requires perforce to be installed
function _p4_edit_current_buffer()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand("%p")
  -- Run the 'p4 edit' command using the full file path
  vim.cmd("!p4 edit " .. current_file)
end

-- Function to execute 'p4 revert' on the current buffer, requires perforce to be installed
function _p4_revert_current_buffer()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand("%p")
  -- Run the 'p4 edit' command using the full file path
  vim.cmd("!p4 revert " .. current_file)
end

-- Set a keymap to run the p4 diff current buffer in float toggleterm
map("n", "<leader>p4d", "<cmd>lua _p4_diff_in_toggleterm()<CR>", { desc = "p4 diff current buffer" })
-- Set a keymap to run the p4 edit current buffer
map("n", "<leader>p4e", "<cmd>lua _p4_edit_current_buffer()<CR>", { desc = "p4 edit current buffer" })
-- Set a keymap to run the p4 revert current buffer
map("n", "<leader>p4r", "<cmd>lua _p4_revert_current_buffer()<CR>", { desc = "p4 revert current buffer" })

-- Mapping for SignifyHunkDiff
map("n", "<leader>shd", ":SignifyHunkDiff<CR>", { desc = " Hunk Diff" })
-- Mapping for SignifyHunkUndo
map("n", "<leader>shu", ":SignifyHunkUndo<CR>", { desc = " Hunk Undo" })
-- Mapping for SignifyNextHunk
map("n", "<leader>shn", "<Plug>(signify-next-hunk)", { desc = " Hunk Next" })
-- Mapping for SignifyPreviousHunk
map("n", "<leader>shp", "<Plug>(signify-prev-hunk)", { desc = " Hunk Previous" })

--Mapping for leap.nvim
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
map({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)", { desc = "Leap from window" })
