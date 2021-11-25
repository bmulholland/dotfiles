-- vimr uses a configured font and throws an error if you use guifont instead
if vim.fn.has("gui_vimr") ~= 1 then
	--[[
  --Pretty fonts, patched for powerline, downloaded from:
  --https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Regular/complete/Victor%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
  --]]
	vim.o.guifont = "VictorMono Nerd Font:h13"
end
