print("hello not neovide")
if vim.g.neovide then
	print("hello from neovide")
	vim.o.guifont = "Source Code Pro:h10"
end
