-- LSP server configuration using the native vim.lsp.config / vim.lsp.enable API (Neovim 0.11+).
-- nvim-lspconfig is kept installed purely for its bundled default configs (cmd, filetypes,
-- root_markers) that ship under its `lsp/` runtime directory.
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"dnlhc/glance.nvim",
			opts = {
				preview_win_opts = { wrap = true, number = true },
				theme = {
					glance_border = { fg = "#41a6b5" },
					glance_preview_border = { fg = "#41a6b5" },
					glance_search_border = { fg = "#41a6b5" },
				},
			},
		},
	},
	config = function()
		-- Global float borders (replaces the deprecated vim.lsp.with(vim.lsp.handlers.hover, ...)).
		vim.o.winborder = "rounded"

		-- Diagnostics display
		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { border = "rounded", source = true },
		})

		-- Completion capabilities from blink.cmp, applied to every server via the '*' wildcard.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok, blink = pcall(require, "blink.cmp")
		if ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end
		vim.lsp.config("*", { capabilities = capabilities })

		-- Per-server overrides (merged on top of nvim-lspconfig's shipped defaults).
		vim.lsp.config("pyright", {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic",
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})

		-- ruff (lint) and clangd (C/C++) use their shipped defaults.
		vim.lsp.enable({ "pyright", "ruff", "lua_ls", "clangd" })

		-- Buffer-local keymaps when a language server attaches.
		-- Note: on 0.11 K, grn, gra, grr, gri, [d, ]d are already built-in defaults.
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				-- Glance (nicer preview windows for LSP locations)
				vim.keymap.set("n", "gL", "<CMD>Glance definitions<CR>", opts)
				vim.keymap.set("n", "gR", "<CMD>Glance references<CR>", opts)
				vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>", opts)
			end,
		})
	end,
}
