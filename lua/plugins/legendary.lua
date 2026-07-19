-- Command palette (VSCode Ctrl+Shift+P). Opened with <leader>? / <leader><leader> (see maps.lua).
-- frecency sorts the most-used commands/keymaps to the top -- the "shortcut history" you wanted.
-- It auto-imports every which-key mapping so the palette is complete.
return {
	"mrjones2014/legendary.nvim",
	priority = 10000,
	lazy = false,
	dependencies = { "kkharji/sqlite.lua" }, -- required for frecency sorting
	opts = {
		extensions = {
			-- auto-import every which-key mapping so the palette is complete
			which_key = { auto_register = true },
		},
		sort = {
			-- Most-recently/most-frequently used float to the top.
			-- Gracefully no-ops if the system sqlite3 library is unavailable.
			frecency = {
				db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
				max_timestamps = 10,
			},
		},
	},
}
