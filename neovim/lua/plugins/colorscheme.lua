return { {
  'LazyVim/LazyVim',
  opts = { colorscheme = 'catppuccin' },
}, -- Auto-switch to dark mode
{
  'cormacrelf/dark-notify',
  config = function()
    local dark_notify = require('dark_notify')

    dark_notify.run({
      schemes = {
        -- You can use different colorschemes for light/dark mode
        dark = 'catppuccin',
        light = 'catppuccin',
      },
    })
  end,
}, -- Temp patch: https://github.com/LazyVim/LazyVim/pull/6354
{
  'akinsho/bufferline.nvim',
  init = function()
    local bufline = require('catppuccin.groups.integrations.bufferline')
    function bufline.get()
      return bufline.get_theme()
    end
  end,
} }
