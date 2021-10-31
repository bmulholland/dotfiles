-- From https://github.com/crivotz/nv-ide/blob/master/lua/plugins/nvim-autopairs.lua
require('nvim-autopairs').setup({
    check_ts = true, -- Use Treesitter
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

-- Add Endwise for ruby and lua
-- https://github.com/windwp/nvim-autopairs/wiki/Endwise
local npairs = require('nvim-autopairs')
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
