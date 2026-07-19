-- Formatting via conform.nvim. Replaces none-ls.
--
-- IMPORTANT: format-on-save is OFF by default so it never rewrites whole files
-- (bad when contributing to projects like CPython that have their own style).
-- Turn it on only when you want it, per-session or per-buffer:
--   :FormatEnable          enable autoformat-on-save (global)
--   :FormatDisable         disable it again (global)
--   :FormatDisable!        disable it for the current buffer only
--   :FormatToggle          flip it, and print the new state
-- Manual formatting always works:
--   <leader>gf  (normal mode) -> format the whole buffer, once
--   <leader>gf  (visual mode) -> format ONLY the selected lines (minimal diff)
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo", "FormatEnable", "FormatDisable", "FormatToggle" },
	opts = {
		formatters_by_ft = {
			python = { "ruff_format" }, -- prefer black? use { "black" } and run :MasonInstall black
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		-- Runs only when explicitly enabled (see the user commands below).
		-- conform honours a project's .clang-format / ruff config automatically.
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 1000, lsp_format = "fallback" }
		end,
	},
	init = function()
		-- Default: disabled everywhere.
		vim.g.disable_autoformat = true

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true -- current buffer only
			else
				vim.g.disable_autoformat = true
			end
		end, { bang = true, desc = "Disable format-on-save" })

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, { desc = "Enable format-on-save" })

		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			vim.notify("Format-on-save: " .. (vim.g.disable_autoformat and "OFF" or "ON"))
		end, { desc = "Toggle format-on-save" })
	end,
}
