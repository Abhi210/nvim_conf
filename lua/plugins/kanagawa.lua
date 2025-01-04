-- ~/.config/nvim/lua/plugins/kanagawa.lua

return {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- Load during startup
    priority = 1000, -- Load this before other plugins
    config = function()
        -- Optional: Configure the theme
        require('kanagawa').setup({
            -- Add any custom configuration here
            compile = false,             -- Enable compiling the colorscheme
            undercurl = true,            -- Enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- Do not set background color
            dimInactive = false,         -- Dim inactive windows
            terminalColors = true,       -- Define vim.g.terminal_color_{0,17}
            theme = "default"    -- Load "default" theme or "dragon" theme
        })

        -- Set colorscheme after options
        vim.cmd("colorscheme kanagawa")
    end
}
