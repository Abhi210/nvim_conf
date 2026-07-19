vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>", { desc = "Save File" })

-- Quit
map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit Neovim" })

-- Exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
map("n", "<leader>r", "<CMD>Neotree focus<CR>", { desc = "Focus NeoTree" })

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>", { desc = "New Vertical Split" })
map("n", "<leader>p", "<CMD>split<CR>", { desc = "New Horizontal Split" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><", { desc = "Resize Window Shrink" })
map("n", "<C-Right>", "<C-w>>", { desc = "Resize Window Grow" })
map("n", "<C-Up>", "<C-w>+", { desc = "Resize Window Tall" })
map("n", "<C-Down>", "<C-w>-", { desc = "Resize Window Short" })

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Fuzzy find opened files" })
map("n", "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Show git file diffs" })
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>", { desc = "Browse git commits" })

-- Command palette (legendary) - most-used shortcuts float to the top
map('n', '<leader>?', '<cmd>Legendary<CR>', { desc = "Command palette (frecency)" })
map('n', '<leader><leader>', '<cmd>Legendary<CR>', { desc = "Command palette (frecency)" })

-- Format (conform). Normal: whole buffer. Visual: only the selected lines (minimal diff).
map({ "n", "v" }, '<leader>gf', function() require("conform").format({ lsp_format = "fallback" }) end, { desc = "Format buffer/selection" })
-- Toggle format-on-save (off by default so it never rewrites whole files)
map('n', '<leader>uf', '<CMD>FormatToggle<CR>', { desc = "Toggle format-on-save" })

-- Terminal (toggleterm)
map('n', '<leader>t', '<cmd>ToggleTerm direction=float<CR>', { desc = "Toggle floating terminal" })

-- Zen-mode
map('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = "Toggle Zen Mode" })

-- Copy to system clipboard
map('v', '<C-C>', '"+y', { desc = 'Copy to system clipboard' })  -- Visual mode
map('n', '<C-C>', '"+y', { desc = 'Copy to system clipboard' })  -- Normal mode

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

-- Flash (jump / motions) - keymaps registered by the plugin itself (see plugins/flash.lua)

--autopairs jump
map("i","<A-l>","<ESC>A",{desc = "Go to the end of matching brackets"})
