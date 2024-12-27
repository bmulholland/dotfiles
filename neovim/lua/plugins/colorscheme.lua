return {
  -- Auto-switch to dark mode
  {
    "cormacrelf/dark-notify",
    config = function()
      local dark_notify = require("dark_notify")

      dark_notify.run({
        schemes = {
          -- Yes, they're the same, but it does actually do something when these change
          dark = "catppuccin",
          light = "catppuccin",
          -- onchange = function(mode)
          --   if mode == "dark" then
          --     require("lualine").setup({ options = { theme = "sonokai" } })
          --   else
          --     require("lualine").setup({ options = { theme = "ayu" } })
          --   end
          -- end,
        },
      })

      -- Avoid flashing the wrong colour at startup:
      -- https://github.com/cormacrelf/dark-notify/issues/3#issuecomment-1074682252
      dark_notify.update()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
