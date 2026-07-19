return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "dropdown",
                },
                buffers = {
                    theme = "dropdown",
                },
                git_status = {
                    theme = "dropdown",
                },
                git_commits = {
                    theme = "dropdown",
                },
            },
        })
    end,
}