-- Installs LSP servers (via mason-lspconfig) and standalone tools (via mason-tool-installer).
-- Server *configuration* lives in plugins/mason-lspconfig.lua.
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	build = ":MasonUpdate",
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright", -- Python types
				"ruff",    -- Python lint (as LSP diagnostics)
				"lua_ls",  -- Lua
				"clangd",  -- C / C++
			},
			-- We enable/configure servers ourselves in mason-lspconfig.lua
			automatic_enable = false,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",       -- Lua formatter
				"clang-format", -- C / C++ formatter
				"debugpy",      -- Python debugger (nvim-dap-python)
				-- Note: Python formatting uses ruff_format (from the ruff LSP above),
				-- so black is intentionally omitted. Add "black" here + swap it into
				-- conform.lua's formatters_by_ft if you prefer black.
			},
		})
	end,
}
