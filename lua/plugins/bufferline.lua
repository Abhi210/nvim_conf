-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',  -- Requires nerd fonts
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",  -- Set to "tabs" if you want to restrict to tabs only
                numbers = "none",
                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = '▎', -- This is a slightly different character
                    style = 'icon',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 18,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                -- Custom area at the top right corner
                custom_areas = {
                    right = function()
                        return {
                            { text = '%@Toggle_theme@' },
                        }
                    end,
                },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true,
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
            }
        })

        -- Key mappings for navigating between tabs
        vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
        vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
        
        -- Optional: Move tabs left/right
        vim.keymap.set('n', '<Leader>bl', '<Cmd>BufferLineMoveNext<CR>', {})
        vim.keymap.set('n', '<Leader>bh', '<Cmd>BufferLineMovePrev<CR>', {})
        
        -- Optional: Go to specific tab
        vim.keymap.set('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
        vim.keymap.set('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
        vim.keymap.set('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
        vim.keymap.set('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
    end,
}
