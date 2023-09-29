-- Background and coloursheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Relative line number
vim.wo.relativenumber = true

-- Copy to system clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Tab width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- Use spaces for tab
vim.opt.expandtab = true

-- Turn off LSP logging
vim.lsp.set_log_level("off")

