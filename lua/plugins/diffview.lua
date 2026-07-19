return {
    "sindrets/diffview.nvim",
    config = function()
        require("diffview").setup({
            -- Other options
            theme = "kanagawa",
        })
    end,
}