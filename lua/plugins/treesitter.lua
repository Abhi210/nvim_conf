-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"python",
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
			},

			sync_install = false,
			auto_install = true,
			ignore_install = {},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			-- Indentation based on treesitter
			indent = { enable = true },

			-- Incrementally select code blocks (normal mode; does not clash with
			-- blink's insert-mode <C-space>).
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-backspace>",
				},
			},
		})
	end,
}
