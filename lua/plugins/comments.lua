return {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        config = function()
            require('Comment').setup({
                -- Add any custom commentstring for languages
                pre_hook = function(ctx)
                    -- For Python docstrings, use '''
                    if vim.bo.filetype == 'python' then
                        local line = vim.api.nvim_get_current_line()
                        if line:match('^%s*def') or line:match('^%s*class') then
                            return '"""'
                        end
                    end
                end,
                -- Enable keybindings
                toggler = {
                    line = 'gcc',  -- Line-comment toggle keymap
                    block = 'gbc', -- Block-comment toggle keymap
                },
                opleader = {
                    line = 'gc',   -- Line-comment keymap
                    block = 'gb',  -- Block-comment keymap
                },
            })
        end
    }
