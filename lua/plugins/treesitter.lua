-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = {
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                -- List of parsers to ignore installing (or "all")
                ignore_install = {},

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers",

                highlight = {
                    enable = true,
                    -- disable = { "c", "rust" },  -- list of languages to disable
                    additional_vim_regex_highlighting = false,
                },

                -- Indentation based on treesitter
                indent = { enable = true },

                -- Incrementally select code blocks
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-backspace>",
                    },
                },

                -- Enable nvim-ts-context-commentstring for better comment strings
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },

                -- Automatically close and rename HTML/JSX tags
                autotag = {
                    enable = true,
                },
            })

            -- Enable folds (zf) based on treesitter
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            -- Don't fold by default
            vim.opt.foldenable = false
        end,
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
    }
}
