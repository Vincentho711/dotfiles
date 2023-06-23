-- Background and coloursheme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Relative line number
vim.wo.relativenumber = true

-- Copy to system clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Tab space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

