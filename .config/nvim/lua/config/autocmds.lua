-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
-- Link Signify highlight groups to GitSigns highlight group
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*", -- Trigger for all colorschemes
  callback = function()
    -- Ensure that gitsigns is loaded before linking
    -- local gitsigns_loaded, _ = pcall(require, "gitsigns")
    -- if gitsigns_loaded then
    -- Link signify highlight groups to gitsigns highlight groups
    vim.api.nvim_command("highlight link SignifySignAdd GitSignsAdd")
    vim.api.nvim_command("highlight link SignifySignDelete GitSignsDelete")
    vim.api.nvim_command("highlight link SignifySignChangeDelete GitSignsChange")
    vim.api.nvim_command("highlight link SignifySignDeleteFirstLine GitSignsDelete")
    -- else
    --   print("Gitsigns is not loaded. Signify highlight groups won't be linked.")
    -- end
  end,
})

-- Functiuon to show the current hunk number and total hunks with Signify's hunk
function _G.show_current_hunk()
  -- Get hunk stats using the internal signify function (this will depend on the available Lua interface for signify)
  local hunk_stats = vim.fn["sy#util#get_hunk_stats"]() -- Call the Vim function from Lua

  if hunk_stats and not vim.tbl_isempty(hunk_stats) then
    -- Print the current hunk and total hunks in the command line
    vim.api.nvim_out_write(string.format("[Hunk %d/%d]\n", hunk_stats.current_hunk, hunk_stats.total_hunks))
  end
end

-- Set up the autocmd to trigger when a hunk is jumped to
vim.api.nvim_exec(
  [[
  augroup ShowHunkStats
    autocmd!
    autocmd User SignifyHunk lua show_current_hunk()
  augroup END
]],
  false
)
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
