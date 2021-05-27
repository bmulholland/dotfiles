" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/bmulholland/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/bmulholland/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/bmulholland/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/bmulholland/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/bmulholland/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dark-notify"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/dark-notify"
  },
  ["dash.vim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/dash.vim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/registers.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-blockle"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-blockle"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-numbertoggle"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-ruby-refactoring"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-ruby-refactoring"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/Users/bmulholland/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
