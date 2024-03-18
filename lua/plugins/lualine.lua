-- Lualine
-- description: A blazing fast and easy to configure Neovim statusline written in Lua.
-- website: https://github.com/nvim-lualine/lualine.nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
			},
			winbar = {
				lualine_a = { "buffers" },
			},
		})
	end,
}
