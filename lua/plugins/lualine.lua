-- Statusline (VSCode-style bottom bar): mode, git branch, diagnostics, file info, venv.
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = function()
		-- Show the active Python virtualenv name when one is set.
		local venv = {
			function()
				local v = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
				if not v then
					return ""
				end
				return " " .. vim.fn.fnamemodify(v, ":t")
			end,
			cond = function()
				return vim.bo.filetype == "python"
			end,
		}

		return {
			options = {
				theme = "kanagawa",
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{ "diagnostics", sources = { "nvim_lsp" } },
					venv,
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		}
	end,
}
