local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

require("packer").init({
	-- Workaround: https://github.com/wbthomason/packer.nvim/issues/746
	-- https://github.com/wbthomason/packer.nvim/issues/456
	max_jobs = 50,
})

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	-- Auto-set line and spacing params
	use("editorconfig/editorconfig-vim")

	-- LSP
	use({
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
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
	use({ -- improves nvim-surround support
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})

	-- Ruby helpers
	use("ecomba/vim-ruby-refactoring") -- Helper methods to refactor Ruby
	use("AndrewRadev/splitjoin.vim") -- toggle between single-line and multi-line code things
	use("tpope/vim-rails") -- Rails helpers

	-- In-editor debugging
	use({ "mfussenegger/nvim-dap" })
	use("suketa/nvim-dap-ruby")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")

	-- Easier test running
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
				},
			})
		end,
	})

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
	-- Next commit breaks config: https://github.com/lukas-reineke/lsp-format.nvim/issues/39
	use("lukas-reineke/lsp-format.nvim") -- Formatting
	-- Nice rename UI
	use({
		"filipdutescu/renamer.nvim",
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

	-- File and tag navigation

	use({ "kevinhwang91/nvim-hlslens" })

	-- use 'ludovicchabant/vim-gutentags' -- (re)generate tag files as you work
	use("andymass/vim-matchup") -- Improved matchit; use % to navigate between paids of brackets, if/end, etc
	-- use 'christoomey/vim-tmux-navigator' -- Consistently navigate between vim and tmux splits
	use("kshenoy/vim-signature") -- show location markers in the gutter
	use("ggandor/leap.nvim") -- More powerful character-based movements

	use("tpope/vim-repeat") -- make dot-repeat work as expected with complex commands

	use("tpope/vim-unimpaired") -- Convenient pairs of mappings, e.g. add a blank line
	use({ -- Easily change surrounding tags (e.g. in html)
		"kylechui/nvim-surround",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use("windwp/nvim-autopairs") -- Autopair brackets
	-- wisely add "end" in ruby, Lua, Vimscript, etc.
	use("RRethy/nvim-treesitter-endwise")
	use({ -- highlight and auto-trim trailing whitespace
		"zakharykaplan/nvim-retrail",
		config = function()
			require("retrail").setup()
		end,
	})

	-- Easily (un)comment out stuff
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Set comment char(s) based on cursor location

	-- Clipboard history
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { { "tami5/sqlite.lua", module = "sqlite" }, { "nvim-telescope/telescope.nvim" } },
	})

	-- Vim UI stuff
	use({
		"viebel/halonot", -- Easier window move operations
		config = function()
			require("halonot").setup({ main_key = "w" })
		end,
	})
	-- situational awareness: scrollbar and indicate search results
	use({ "petertriho/nvim-scrollbar" })
	use({ -- Pretty status line
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- Some LSP servers take a while to initialize. This provides a nice visual
	-- indicator to show which clients are ready to use.
	use("WhoIsSethDaniel/lualine-lsp-progress")

	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Add a gutter that shows git additions/deletions/etc
	use("kyazdani42/nvim-tree.lua") -- File Explorer
	use("kyazdani42/nvim-web-devicons") -- Nicer icons
	use("lukas-reineke/indent-blankline.nvim") -- Indentation guide lines
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ -- Keep the window stable when opening quickfix/Trouble
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	use({ -- dim unused vars
		-- Have to use a branch with a fix until PR merged:
		--https://github.com/NarutoXY/dim.lua/pull/19
		-- "narutoxy/dim.lua",
		"Gelio/dim.lua",
		branch = "fix-treesitter-api-function-name",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
		config = function()
			require("dim").setup({})
		end,
	})

	use("f-person/git-blame.nvim")
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

	use("p00f/nvim-ts-rainbow") -- Different colours for nested parentheses
	use("RRethy/vim-illuminate")
	use({ -- see the color tailwind classes apply
		"mrshmllow/document-color.nvim",
		config = function()
			require("document-color").setup({
				-- Default options
				mode = "background", -- "background" | "foreground" | "single"
			})
		end,
	})
end)
