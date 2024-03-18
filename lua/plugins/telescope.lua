-- Telescope
-- description: Nvim search tool
-- website: https://github.com/nvim-telescope/telescope.nvim
-- manual installation:
-- 1) sudo apt-get install ripgrep
-- 2) install nerdfonts and set the choosen font in your terminal: https://www.nerdfonts.com/font-downloads
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>sc", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
