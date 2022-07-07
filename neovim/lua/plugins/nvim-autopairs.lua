-- From https://github.com/crivotz/nv-ide/blob/master/lua/plugins/nvim-autopairs.lua
require("nvim-autopairs").setup({
	check_ts = true, -- Use Treesitter
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
