-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")
require("vince.core.keymaps")
require("vince.core.options")
require("vince.configs.nvim-tree")
require("vince.configs.lualine")
require("vince.configs.telescope")
require("vince.configs.which-key")
require("vince.configs.treesitter")
require("vince.configs.autopairs")
require("vince.configs.nvim-cmp")
require("vince.configs.gitsigns")
require("vince.configs.comment")
require("vince.configs.neogen")
require("vince.configs.lsp.mason")
require("vince.configs.lsp.lspsaga")
require("vince.configs.lsp.lspconfig")
