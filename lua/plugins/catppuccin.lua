-- Catppuccin
-- description: Neovim graphical interface
-- website: https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
