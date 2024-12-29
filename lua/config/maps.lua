vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Fuzzy find opened files" })
map("n", "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Show git file diffs" })
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>", { desc = "Browse git commits" })

-- Workspaces
map('n', '<leader>wn', '<cmd>WorkspacesOpen nvim<CR>', { desc = "Nvim config" })
map('n', '<leader>wr', '<cmd>WorkspacesOpen reascripts<CR>', { desc = "ReaScripts" })
map('n', '<leader>?', '<cmd>Cheatsheet<cr>', { desc = "Cheatsheet" })

-- Yanky
map("n", "p", "<Plug>(YankyPutAfter)", { desc = "Yanky put after" })
map("n", "P", "<Plug>(YankyPutBefore)", { desc = "Yanky put before" })
map("x", "p", "<Plug>(YankyPutAfter)", { desc = "Yanky put after" })
map("x", "P", "<Plug>(YankyPutBefore)", { desc = "Yanky put before" })
map("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky put after" })
map("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky put before" })
map("x", "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky put after" })
map("x", "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky put before" })
map("n", "<c-n>", "<Plug>(YankyCycleForward)", { desc = "Yanky cycle forward" })
map("n", "<c-p>", "<Plug>(YankyCycleBackward)", { desc = "Yanky cycle backward" })

-- Leap
map("n", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
map("n", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
map("o", "z", "<Plug>(leap-forward)", { desc = "Leap forward" })
map("o", "Z", "<Plug>(leap-backward)", { desc = "Leap backward" })
map("o", "x", "<Plug>(leap-forward-x)", { desc = "Leap forward x" })
map("o", "X", "<Plug>(leap-backward-x)", { desc = "Leap backward x" })
