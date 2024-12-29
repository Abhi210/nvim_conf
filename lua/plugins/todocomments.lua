return {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require("todo-comments").setup({
                signs = true,      -- Show icons in the signs column
                sign_priority = 8, -- Sign priority
                
                -- Keywords recognized as todo comments
                keywords = {
                    FIX = {
                        icon = " ", -- Icon used for this keyword
                        color = "error", -- Color for this keyword
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- Alternatives
                    },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
                
                -- Highlight groups (colors)
                highlight = {
                    before = "", -- "fg" or "bg" or empty
                    keyword = "wide", -- "fg", "bg", "wide" or empty
                    after = "fg", -- "fg" or "bg" or empty
                    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns
                    comments_only = true, -- Only apply to comments
                    max_line_len = 400, -- Ignore lines longer than this
                    exclude = {}, -- List of file types to exclude highlighting
                },
                
                -- Integration with telescope
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                    },
                    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                },
            })

            -- Keybindings for todo-comments
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            -- Add command to list all todos in telescope
            vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>",
                { desc = "Todo Comments" })
        end
    }
