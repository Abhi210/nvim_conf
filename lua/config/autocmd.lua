local aucmd = vim.api.nvim_create_autocmd

local function augroup(name, fnc)
  fnc(vim.api.nvim_create_augroup(name, { clear = true }))
end

augroup("ibhagwan/ToggleSearchHL", function(g)
    vim.api.nvim_create_autocmd("InsertEnter", {
        group = g,
        callback = function()
            vim.schedule(function() vim.cmd("nohlsearch") end)
        end
    })
vim.api.nvim_create_autocmd("CursorMoved", {
    group = g,
    callback = function()
        -- No bloat lua adpatation of: https://github.com/romainl/vim-cool
        local view, rpos = vim.fn.winsaveview(), vim.fn.getpos(".")
        -- Move the cursor to a position where (whereas in active search) pressing `n`
        -- brings us to the original cursor position, in a forward search / that means
        -- one column before the match, in a backward search ? we move one col forward
        vim.cmd(string.format("silent! keepjumps go%s",
        (vim.fn.line2byte(view.lnum) + view.col + 1 - (vim.v.searchforward == 1 and 2 or 0))))
        -- Attempt to goto next match, if we're in an active search cursor position
        -- should be equal to original cursor position
        local ok, _ = pcall(vim.cmd, "silent! keepjumps norm! n")
        local insearch = ok and (function()
            local npos = vim.fn.getpos(".")
            return npos[2] == rpos[2] and npos[3] == rpos[3]
        end)()
        -- restore original view and position
        vim.fn.winrestview(view)
            if not insearch then
            vim.schedule(function() vim.cmd("nohlsearch") end)
            end
        end
    })
end)


-- Display help|man in vertical splits and map 'q' to quit
augroup("ibhagwan/Help", function(g)
  local function open_vert()
    -- do nothing for floating windows or if this is
    -- the fzf-lua minimized help window (height=1)
    local cfg = vim.api.nvim_win_get_config(0)
    if cfg and (cfg.external or cfg.relative and #cfg.relative > 0)
        or vim.api.nvim_win_get_height(0) == 1 then
      return
    end
    -- do not run if Diffview is open
    if vim.g.diffview_nvim_loaded and
        require "diffview.lib".get_current_view() then
      return
    end
    local width = math.floor(vim.o.columns * 0.75)
    vim.cmd("wincmd L")
    vim.cmd("vertical resize " .. width)
    vim.keymap.set("n", "q", "<CMD>q<CR>", { buffer = true })
  end

  aucmd("FileType", {
    group = g,
    pattern = "help,man",
    callback = open_vert,
  })
  -- we also need this auto command or help
  -- still opens in a split on subsequent opens
  aucmd("BufEnter", {
    group = g,
    pattern = "*.txt",
    callback = function()
      if vim.bo.buftype == "help" then
        open_vert()
      end
    end
  })
  aucmd("BufHidden", {
    group = g,
    pattern = "man://*",
    callback = function()
      if vim.bo.filetype == "man" then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.defer_fn(function()
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end, 0)
      end
    end
  })
end)
