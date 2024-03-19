return {
	{
		-- install without yarn or npm
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
      -- TODO: add shortcuts to the preview commands...
		end,
	},
}
