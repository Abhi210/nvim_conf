return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()      -- auto-close brackets/quotes (replaces nvim-autopairs)
		require("mini.comment").setup()    -- gc / gcc commenting (context-aware)
		require("mini.move").setup()       -- Alt+hjkl to move lines/selections
		require("mini.cursorword").setup() -- highlight other uses of word under cursor
		require("mini.notify").setup()     -- notifications (replaces nvim-notify)
		require("mini.indentscope").setup({ -- VSCode-style indent guides
			symbol = "│",
			options = { try_as_border = true },
		})
	end,
}
