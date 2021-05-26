-- Emulates https://github.com/drzel/vim-scrolloff-fraction
-- Via https://neovim.discourse.group/t/plugins-alternative-in-lua/468

-- From https://github.com/nimaipatel/dotfiles/blob/ee6ee2bb7847a0162d7ae8ab791a67344537f2fe/.config/nvim/lua/nimai/utils.lua
local globalListenerName = 'globallistenername'
local autocmdhandlers = {}

_G[globalListenerName] = function (name)
	autocmdhandlers[name]()
end

function AddEventListener (name, events, cb)
	autocmdhandlers[name] = cb
	vim.cmd('augroup ' .. name)
	vim.cmd('autocmd!')
	for _, v in ipairs(events) do
		local cmd = 'lua ' .. globalListenerName .. '("' .. name ..'")'
		vim.cmd('au ' .. v .. ' ' .. cmd)
	end
	vim.cmd('augroup end')
end

-- From https://github.com/nimaipatel/dotfiles/blob/master/.config/nvim/lua/nimai/misc.lua
AddEventListener('ScrolloffFraction', { 'BufEnter,WinEnter,WinNew,VimResized *,*.*' }, function ()
	if (vim.bo.filetype ~= 'qf') then
		local vis_lines = vim.api.nvim_win_get_height(vim.fn.win_getid())
		vim.o.scrolloff = math.floor(vis_lines * 0.25)
	end
end)

AddEventListener('LuaHighlight', { 'TextYankPost *' }, function()
	require'vim.highlight'.on_yank()
end)

AddEventListener('DisableHighLight', { 'InsertEnter *' }, function ()
	vim.o.hlsearch = false
end)

AddEventListener('EnableHighLight', { 'InsertLeave *' }, function ()
	vim.o.hlsearch = true
end)
