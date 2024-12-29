return {
  "williamboman/mason.nvim",
  dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
         "neovim/nvim-lspconfig",
	},

  build = ":MasonUpdate", -- Automatically update Mason packages
  config = function()
    require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

    require("mason-lspconfig").setup({
			automatic_installation = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"black", -- python formatter
                "ruff"
			},
		})

  end,
}

