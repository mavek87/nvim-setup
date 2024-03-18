-- Nvim treesitter
-- description: Highlighting based on programming language
-- website: https://github.com/nvim-treesitter/nvim-treesitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				--[[
			ensure_installed = {
			},
      --]]
				highlight = { enable = true, disable = { "lua" } },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
