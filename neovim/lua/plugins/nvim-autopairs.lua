-- From https://github.com/crivotz/nv-ide/blob/master/lua/plugins/nvim-autopairs.lua
require('nvim-autopairs').setup({
    check_ts = true, -- Use Treesitter
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

-- Add Endwise for ruby and lua
-- https://github.com/windwp/nvim-autopairs/wiki/Endwise
local npairs = require('nvim-autopairs')
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
