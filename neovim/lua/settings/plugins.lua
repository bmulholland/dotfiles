local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	-- Auto-set line and spacing params
	use("editorconfig/editorconfig-vim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	-- WhichKey: help remember and learn shortcuts
	use("folke/which-key.nvim")

	-- autocompletion for wildmenu
	use("gelguy/wilder.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow") -- Different colours for nested parentheses

	-- Ruby helpers
	use("ecomba/vim-ruby-refactoring") -- Helper methods to refactor Ruby
	use("AndrewRadev/splitjoin.vim") -- toggle between single-line and multi-line code things
	use("tpope/vim-rails") -- Rails helpers

	use("hashivim/vim-terraform") -- Terraform support

	-- Autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("ray-x/cmp-treesitter")

	use("SirVer/ultisnips") -- Snippets
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("ray-x/lsp_signature.nvim") -- Display method signatures
	use("onsails/lspkind-nvim") -- Nicer pictograms
	-- Nice rename UI
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Fuzzy file search
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Faster sorting
	use("ahmedkhalf/project.nvim") -- keep track of porjects, and cd to the correct dir
	use("fhill2/telescope-ultisnips.nvim")

	-- Documentation lookups
	use({ "mrjones2014/dash.nvim", requires = { "nvim-telescope/telescope.nvim" }, run = "make install" })

	-- Git
	use("tpope/vim-fugitive") -- Git helper commands
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("sindrets/diffview.nvim")

	-- Easier test running
	use({ "rcarriga/vim-ultest", requires = { "janko/vim-test" }, run = ":UpdateRemotePlugins" })

	-- File and tag navigation
	-- use 'ludovicchabant/vim-gutentags' -- (re)generate tag files as you work
	use("andymass/vim-matchup") -- Improved matchit; use % to navigate between paids of brackets, if/end, etc
	-- use 'christoomey/vim-tmux-navigator' -- Consistently navigate between vim and tmux splits
	use("kshenoy/vim-signature") -- show location markers in the gutter
	use("ggandor/lightspeed.nvim") -- More powerful character-based movements

	use("tpope/vim-surround") -- Easily change surrounding tags (e.g. in html)
	use("windwp/nvim-autopairs") -- Autopair brackets

	-- Easily (un)comment out stuff
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Set comment char(s) based on cursor location

	-- Clipboard history
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { { "tami5/sqlite.lua", module = "sqlite" }, { "nvim-telescope/telescope.nvim" } },
	})

	-- Vim UI stuff
	use("kyazdani42/nvim-tree.lua") -- File Explorer
	use("kyazdani42/nvim-web-devicons") -- Nicer icons
	use("lukas-reineke/indent-blankline.nvim") -- Indentation guide lines
	use({ -- Pretty status line
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Add a gutter that shows git additions/deletions/etc
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ -- Keep the window stable when opening quickfix/Trouble
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	use("folke/todo-comments.nvim") -- Highlight TODOs
	use("kosayoda/nvim-lightbulb") -- Show a lightbulb when a code fix is available
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- improved diagnostics ui
	use({ -- More code action into
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	-- Color theme
	use("sainnhe/sonokai") -- dark color scheme
	use("Shatur/neovim-ayu") -- light color scheme

	-- Auto-switch to dark mode
	use("cormacrelf/dark-notify")
end)
