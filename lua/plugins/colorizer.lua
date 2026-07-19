-- Maintained fork of nvim-colorizer (norcalli's is unmaintained and uses deprecated APIs).
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			css = true,
			css_fn = true,
			tailwind = true,
		},
	},
}
