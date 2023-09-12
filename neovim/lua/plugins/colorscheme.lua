return {
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "shusia" -- variation inspired by Monokai Pro
      vim.g.sonokai_enable_italic = 1
    end,
  }, -- dark color scheme
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
        overrides = {
          -- These are the cursor values from ayu colors
          IlluminatedWordText = { bg = "#EFF0F1" },
          IlluminatedWordRead = { bg = "#EFF0F1" },
          IlluminatedWordWrite = { bg = "#EFF0F1" },
        },
      })
    end,
  }, -- light color scheme

  -- Auto-switch to dark mode
  {
    "cormacrelf/dark-notify",
    config = function()
      local dark_notify = require("dark_notify")

      dark_notify.run({
        schemes = {
          dark = "sonokai",
          light = "ayu",
          onchange = function(mode)
            if mode == "dark" then
              require("lualine").setup({ options = { theme = "sonokai" } })
            else
              require("lualine").setup({ options = { theme = "ayu" } })
            end
          end,
        },
      })

      -- Avoid flashing the wrong colour at startup:
      -- https://github.com/cormacrelf/dark-notify/issues/3#issuecomment-1074682252
      dark_notify.update()
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "ayu" },
    },
  },
}
