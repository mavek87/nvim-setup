-- Nvim treesitter
-- description: Highlighting based on programming language
-- website: https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			--[[
			ensure_installed = {
				"lua",
				"java",
				"bash",
				"kotlin",
				"javascript",
				"json",
				"html",
				"css",
				"scss",
				"c",
				"rust",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"sql",
				"terraform",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
      --]]
			highlight = { enable = true, disable = { "lua" } },
			indent = { enable = true },
		})
	end,
}
