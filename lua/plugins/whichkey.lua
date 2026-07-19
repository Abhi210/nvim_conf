-- ~/.config/nvim/lua/plugins/whichkey.lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		replace = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		keys = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		win = {
			border = "rounded", -- none, single, double, shadow
			--position = "bottom", -- bottom, top
			--margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			--padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			wo = { winblend = 20 },
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		--filter = true, -- enable this to hide mappings for which you didn't specify a label
		--hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		--triggers = { "<leader>" }, -- automatically setup triggers
	},
	config = function(_, opts)
		-- Set timeout options
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		-- Setup which-key with the options
		local wk = require("which-key")
		wk.setup(opts)

		-- Group labels so the <leader> popup is organized (VSCode-command-palette feel)
		wk.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git / Format" },
			{ "<leader>d", group = "Debug / Diagnostics" },
			{ "<leader>b", group = "Buffer" },
		})

		-- Register Ctrl mappings with which-key (no top-level prefix)
		wk.add({
			{ "<C-Down>", "<C-w>-", desc = "Resize Window Shorter" },
			{ "<C-Left>", "<C-w><", desc = "Resize Window Shrink" },
			{ "<C-Right>", "<C-w>>", desc = "Resize Window Grow" },
			{ "<C-Up>", "<C-w>+", desc = "Resize Window Taller" },
			{ "<C-c>", '"+y', desc = "Copy to Clipboard" },
			{ "<C-h>", "<C-w>h", desc = "Window Left" },
			{ "<C-j>", "<C-w>j", desc = "Window Down" },
			{ "<C-l>", "<C-w>l", desc = "Window Right" },
		})

		wk.add({
			{ "<leader>[g", "<cmd>lua require('gitsigns').prev_hunk()<CR>", desc = "Prev Hunk" },
			{ "<leader>]g", "<cmd>lua require('gitsigns').next_hunk()<CR>", desc = "Next Hunk" },
			{ "<leader>h", group = "[H]unk" },
			{ "<leader>hD", "<cmd>Gitsigns diffthis('~')<CR>", desc = "Diff This (Cached)" },
			{ "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
			{ "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
			{ "<leader>hb", "<cmd>lua require('gitsigns').blame_line({full=true})<CR>", desc = "Blame Line" },
			{ "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
			{ "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
			{ "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
			{ "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
			{ "<leader>ht", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle Deleted" },
			{ "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
		})
	end,
}
