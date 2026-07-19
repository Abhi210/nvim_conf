-- Integrated terminal (VSCode Ctrl+` feel). <leader>t opens a float; <C-\> toggles.
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm", "TermExec" },
	keys = { [[<C-\>]], "<leader>t" },
	opts = {
		open_mapping = [[<C-\>]],
		direction = "float",
		float_opts = { border = "rounded" },
		shade_terminals = true,
	},
}
