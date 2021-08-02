-- From https://github.com/crivotz/nv-ide/blob/master/lua/plugins/nvim-autopairs.lua
require('nvim-autopairs').setup({
    check_ts = true, -- Use Treesitter
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

-- Add Endwise for ruby
-- https://github.com/windwp/nvim-autopairs/wiki/Endwise
local npairs = require('nvim-autopairs')
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
