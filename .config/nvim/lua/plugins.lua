return require('packer').startup(function(use)
	use { "wbthomason/packer.nvim" }
	use { "ellisonleao/gruvbox.nvim" }
	-- Nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}
	-- Which keys
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {

			}
			end
	}
  -- Lualine
  use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" , opt = true } }
	-- Plenary
	use { "nvim-lua/plenary.nvim" }
	-- Telescope
	use { "nvim-telescope/telescope.nvim", tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } 
	}
	-- Nvim treesitter
	use { 
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
	-- Auto closing brackets and quot. marks with autopairs
	use { "windwp/nvim-autopairs" }

	-- Autocompletion
	-- Completion plugin
	use { "hrsh7th/nvim-cmp" } 
	-- Source for text in buffer
	use { "hrsh7th/cmp-buffer" }	
	-- source for file system paths
	use { "hrsh7th/cmp-path" }

	-- Snippets
	-- Snippet Engine
	use { "L3MON4D3/LuaSnip" }
	-- For autocompletion
	use { "saadparwaiz1/cmp_luasnip" }
	-- Useful snippets
	use { "rafamadriz/friendly-snippets"}

	-- Mason for managing & installing LSP
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	-- Nvim-lspconfig for configuring LSP servers
	use { "neovim/nvim-lspconfig" }
	-- Cmp-nvim-lsp for auto-completion for LSP servers
	use { "hrsh7th/cmp-nvim-lsp" }
	-- lspsaga for enhanced UI of lsp  
	use { "glepnir/lspsaga.nvim", branch = "main" }
	-- lspkind for VSCode icon for autocompletion
	use { "onsails/lspkind.nvim" }

	-- Gitsigns for git utilities like highlighting new lines
	use { "lewis6991/gitsigns.nvim" }

  -- Comment for commenting line/blocks using shortcuts
  use { "numToStr/Comment.nvim" }
end)
