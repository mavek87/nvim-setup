-- LSP-CONFIG (Mason)
-- description: Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
-- website:
-- 1) https://github.com/williamboman/mason.nvim
-- 2) https://github.com/williamboman/mason-lspconfig.nvim
-- `mason-lspconfig` provides extra, opt-in, functionality that allows you to
-- automatically set up LSP servers installed via `mason.nvim` without having to
-- manually add each server setup to your Neovim configuration. It also makes it
-- possible to use newly installed servers without having to restart Neovim!
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					---- Language servers list
					"lua_ls", -- lua
					"jdtls", -- java
					"kotlin_language_server", -- kotlin
					"gradle_ls", -- gradle
					"groovyls", --groovy
					--"tsserver", -- javascript | typescript. Official from typescript but not the best
					"vtsls", -- javascript | typescript. Better than tsserver, similar to vscode (it brings in also tsserver)
					"bashls", --bash
					"jsonls", -- json
					"yamlls", --yaml
					"lemminx", -- xml
					"html", -- html
					"cssls", -- css | SCSS | LESS
					"dockerls", -- docker
					"docker_compose_language_service", -- docker compose
					"taplo", -- toml
					--"tailwindcss", -- tailwind
					"sqlls", -- sql (there are other choices avalibale)
					"terraformls", -- terraform (there are other choices availalbe)
					"marksman", -- markdown (there are other choices available)
					"ansiblels", -- ansible
					"eslint", -- eslint
					"clangd", -- c and c++
					--"gopls",                         -- go
				},
			})

      -- The next code would avoid ALL the manual setups in nvim-lspconfig, BUT I dont know how to apply capabilities here...
			--[[
			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					-- The first entry (without a key) will be the default handler
					-- and will be called for each installed server that doesn't have
					require("lspconfig")[server_name].setup({})
					-- Next, you can provide a dedicated handler for specific servers.
					-- For example, a handler override for the `rust_analyzer`:
					--["rust_analyzer"] = function ()
					--  require("rust-tools").setup {}
					--end
				end,
			})
      --]]
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
			lspconfig.gradle_ls.setup({ capabilities = capabilities })
			lspconfig.groovyls.setup({ capabilities = capabilities })
			lspconfig.vtsls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.lemminx.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
			lspconfig.taplo.setup({ capabilities = capabilities })
			--lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.terraformls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.ansiblels.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })

			vim.keymap.set("n", "<leader>doc", vim.lsp.buf.hover, {})
			-- non so cosa fa:
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lfi", ":LspInfo <CR>", {})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			-- require("your.null-ls.config") -- require your null-ls config here (example below)
			--require("mason").setup()
			require("mason-null-ls").setup({
				automatic_installation = true,
				handlers = {},
				ensure_installed = {
					"stylua",
					"prettier",
					"eslint_d",
					"snyk",
				},
			})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					--null_ls.builtins.diagnostics.eslint,
					--	null_ls.builtins.formatting.eslint_d,
					--null_ls.builtins.completion.spell,
				},
			})

			vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})
		end,
	},
}
