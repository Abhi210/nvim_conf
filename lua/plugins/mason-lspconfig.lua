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

		-- Resolve the interpreter pyright should use for import resolution.
		-- Without this, pyright falls back to the system python and reports every
		-- third-party import as missing. :VenvSelect (,v) overrides this at runtime.
		local function resolve_python(root)
			if vim.env.VIRTUAL_ENV then
				return vim.env.VIRTUAL_ENV .. "/bin/python"
			end
			for _, dir in ipairs({ ".venv", "venv", "env" }) do
				local py = root and (root .. "/" .. dir .. "/bin/python")
				if py and vim.uv.fs_stat(py) then
					return py
				end
			end
			return vim.fn.exepath("python3")
		end

		vim.lsp.config("pyright", {
			-- Must be on_init, not before_init: client.settings is copied from the config
			-- before before_init runs, so mutating it there is too late. pyright pulls
			-- settings via workspace/configuration after initialize, so this lands in time.
			on_init = function(client)
				client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
					python = { pythonPath = resolve_python(client.root_dir) },
				})
			end,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						-- Was "workspace", which made pyright type-check every .py file
						-- under the root (including site-packages) and stall on exit.
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic",
						exclude = { "**/.venv", "**/venv", "**/env", "**/node_modules", "**/__pycache__", "**/.git" },
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

		-- Safety net: on :qa Neovim asks each server to shut down gracefully and blocks
		-- waiting for it. A server busy in a long analysis pass never answers, hanging
		-- the editor. Kill them outright instead -- nothing needs saving at this point.
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				vim.lsp.stop_client(vim.lsp.get_clients(), true)
			end,
		})

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
