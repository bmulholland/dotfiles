local execute = vim.api.nvim_command
local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Packer can manage itself as an optional plugin
	"wbthomason/packer.nvim",

	-- Auto-set line and spacing params
	"editorconfig/editorconfig-vim",

	-- LSP
	{
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},

	-- WhichKey: help remember and learn shortcuts
	"folke/which-key.nvim",
	-- Delay repeat execution of certain kt, module = "sqlite"ys
	"ja-ford/delaytrain.nvim",

	-- autocompletion for wildmenu
	"gelguy/wilder.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		-- improves nvim-surround support
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- Ruby helpers
	"ecomba/vim-ruby-refactoring", -- Helper methods to refactor Ruby
	"AndrewRadev/splitjoin.vim", -- toggle between single-line and multi-line code things
	"tpope/vim-rails", -- Rails helpers

	-- In-editor debugging
	{ "mfussenegger/nvim-dap" },
	"suketa/nvim-dap-ruby",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"theHamsta/nvim-dap-virtual-text",

	-- Easier test running
	{
		"nvim-neotest/neotest",
		dependencies = {
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
	},

	-- Autocomplete
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"ray-x/cmp-treesitter",

	"SirVer/ultisnips", -- Snippets
	"quangnguyen30192/cmp-nvim-ultisnips",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",

	"ray-x/lsp_signature.nvim", -- Display method signatures
	"onsails/lspkind-nvim", -- Nicer pictograms
	-- Next commit breaks config: https://github.com/lukas-reineke/lsp-format.nvim/issues/39
	"lukas-reineke/lsp-format.nvim", -- Formatting
	-- Nice rename UI
	{
		"filipdutescu/renamer.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Fuzzy file search
	{ "nvim-telescope/telescope.nvim", dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Faster sorting
	"ahmedkhalf/project.nvim", -- keep track of porjects, and cd to the correct dir
	"fhill2/telescope-ultisnips.nvim",

	-- Documentation lookups
	{ "mrjones2014/dash.nvim", dependencies = { "nvim-telescope/telescope.nvim" }, build = "make install" },

	-- Git
	"tpope/vim-fugitive", -- Git helper commands
	{ "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim" },
	"sindrets/diffview.nvim",

	-- File and tag navigation

	{ "kevinhwang91/nvim-hlslens" },
	"andymass/vim-matchup", -- Improved matchit; use % to navigate between paids of brackets, if/end, etc
	"kshenoy/vim-signature", -- show location markers in the gutter
	"ggandor/leap.nvim", -- More powerful character-based movements

	"tpope/vim-repeat", -- make dot-repeat work as expected with complex commands

	"tpope/vim-unimpaired", -- Convenient pairs of mappings, e.g. add a blank line
	{
		-- Easily change surrounding tags (e.g. in html,
		"kylechui/nvim-surround",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"windwp/nvim-autopairs", -- Autopair brackets
	-- wisely add "end" in ruby, Lua, Vimscript, etc.
	"RRethy/nvim-treesitter-endwise",
	{
		-- highlight and auto-trim trailing whitespace
		"zakharykaplan/nvim-retrail",
		config = function()
			require("retrail").setup()
		end,
	},

	-- Easily (un)comment out stuff
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring", -- Set comment char(s, based on cursor location

	-- Clipboard history
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = { { "tami5/sqlite.lua" }, { "nvim-telescope/telescope.nvim" } },
	},

	-- Vim UI stuff
	{
		"viebel/halonot", -- Easier window move operations
		config = function()
			require("halonot").setup({ main_key = "w" })
		end,
	},
	-- situational awareness: scrollbar and indicate search results
	"petertriho/nvim-scrollbar",
	{
		-- Pretty status line
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	},
	-- Some LSP servers take a while to initialize. This provides a nice visual
	-- indicator to show which clients are ready to use.
	"WhoIsSethDaniel/lualine-lsp-progress",
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Add a gutter that shows git additions/deletions/etc
	"kyazdani42/nvim-tree.lua", -- File Explorer
	"kyazdani42/nvim-web-devicons", -- Nicer icons
	"lukas-reineke/indent-blankline.nvim", -- Indentation guide lines
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		-- Keep the window stable when opening quickfix/Trouble
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{
		-- dim unused vars
		"zbirenbaum/neodim",
		event = "LspAttach",
		branch = "v2",
		config = function()
			require("neodim").setup({
				refresh_delay = 75, -- time in ms to wait after typing before refresh diagnostics
				alpha = 0.75,
				blend_color = "#000000",
				hide = { underline = true, virtual_text = true, signs = true },
				disable = {}, -- table of filetypes to disable neodim
			})
		end,
	},

	"f-person/git-blame.nvim",
	"folke/todo-comments.nvim", -- Highlight TODOs
	"kosayoda/nvim-lightbulb", -- Show a lightbulb when a code fix is available
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" }, -- improved diagnostics ui
	{
		-- More code action into
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},

	-- Color theme
	"sainnhe/sonokai", -- dark color scheme
	"Shatur/neovim-ayu", -- light color scheme

	-- Auto-switch to dark mode
	"cormacrelf/dark-notify",

	"HiPhish/rainbow-delimiters.nvim", -- Different colours for nested parentheses
	"RRethy/vim-illuminate",
	{
		-- see the color tailwind classes apply
		"mrshmllow/document-color.nvim",
		config = function()
			require("document-color").setup({
				-- Default options
				mode = "background", -- "background" | "foreground" | "single"
			})
		end,
	},

	-- AI coding
	"github/copilot.vim",
}, {
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		frequency = 3600 * 24, -- check for updates every day
	},
})
