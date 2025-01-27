return {
  "mhinz/vim-signify",
  config = function()
    -- Set updatetime in lua way
    vim.opt.updatetime = 800
    -- Set signify settings
    vim.g.signify_line_highlight = 0
    vim.g.signify_number_highlight = 0
    vim.g.signify_sign_add = "|"
    vim.g.signify_sign_delete = "_"
    vim.g.signify_sign_change = "|"
    vim.g.signify_sign_delete_first_line = "‾"
    vim.g.signify_sign_change_delete = "~"
  end,
}
