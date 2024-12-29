-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local autopairs = require("nvim-autopairs")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        autopairs.setup({
            check_ts = true, -- Enable treesitter
            ts_config = {
                lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
                python = { "string" }, -- Don't add pairs in python string treesitter nodes
            },
            -- Enable basic rules
            enable_check_bracket_line = true,
            disable_filetype = { "TelescopePrompt" },
            -- Will not add a close pair if the next char is in the list
            ignored_next_char = "[%w%.]",
            -- Fast wrap
            fast_wrap = {
                map = "<M-e>", -- Alt-e to fast wrap
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "Search",
                highlight_grey = "Comment"
            },
        })

        -- Make it work with cmp
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        -- Add spaces between parentheses
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        -- Add space between parentheses
        autopairs.add_rules({
            Rule(' ', ' ')
                :with_pair(function(opts)
                    local pair = opts.line:sub(opts.col - 1, opts.col)
                    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
                end),
            Rule('( ', ' )')
                :with_pair(function() return false end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%)') ~= nil
                end)
                :use_key(')'),
            Rule('{ ', ' }')
                :with_pair(function() return false end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%}') ~= nil
                end)
                :use_key('}'),
            Rule('[ ', ' ]')
                :with_pair(function() return false end)
                :with_move(function(opts)
                    return opts.prev_char:match('.%]') ~= nil
                end)
                :use_key(']'),
        })
    end,
}
