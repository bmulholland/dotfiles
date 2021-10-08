-- Config from https://github.com/crivotz/nv-ide/blob/master/lua/plugins/telescope.lua
local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		file_ignore_patterns = {"sorbet/*", "spec/vcr_cassettes/*", "%.svg", "%.png", "%.woff2"}
	}
}

-- Extensions

require('telescope').load_extension('ultisnips')
require('telescope').load_extension('projects')
require('telescope').load_extension('fzf') -- faster sorting

-- Implement delta as previewer for diffs

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local M = {}

local delta = previewers.new_termopen_previewer {
	get_command = function(entry)
		-- this is for status
		-- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
		-- just do an if and return a different command
		if entry.status == '??' or 'A ' then
			return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
		end

		-- note we can't use pipes
		-- this command is for git_commits and git_bcommits
		return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

	end
}

M.my_git_commits = function(opts)
	opts = opts or {}
	opts.previewer = delta

	builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
	opts = opts or {}
	opts.previewer = delta

	builtin.git_bcommits(opts)
end

M.my_git_status = function(opts)
	opts = opts or {}
	opts.previewer = delta

	builtin.git_status(opts)
end

M.project_files = function()
	local opts = {} -- define here if you want to define something
	local ok = pcall(require'telescope.builtin'.git_files, opts)
	if not ok then require'telescope.builtin'.find_files(opts) end
end

return M

