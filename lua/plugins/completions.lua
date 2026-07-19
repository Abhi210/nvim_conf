-- Completion engine: blink.cmp (replaces the nvim-cmp + hrsh7th/* + LuaSnip stack).
-- Batteries included: LSP/path/snippets/buffer sources, fuzzy matching, signature help.
return {
	"saghen/blink.cmp",
	version = "*", -- use a release tag so lazy downloads the prebuilt fuzzy-matcher binary
	dependencies = { "rafamadriz/friendly-snippets" },
	event = "InsertEnter",
	opts = {
		-- 'default'   : C-y confirm, C-n/C-p or arrows to navigate
		-- 'super-tab' : VSCode-like, Tab to accept
		-- 'enter'     : Enter to accept
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			menu = { border = "rounded" },
			ghost_text = { enabled = true },
		},

		signature = { enabled = true, window = { border = "rounded" } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- Rust fuzzy matcher with automatic fallback to the Lua implementation
		fuzzy = { implementation = "prefer_rust_with_warning" },

		cmdline = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
