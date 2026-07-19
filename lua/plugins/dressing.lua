return {
  "stevearc/dressing.nvim",
  config = function()
    -- Optional configuration for dressing.nvim if needed
    require("dressing").setup({
      input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = "Input:",

        -- Can be 'left', 'right', or 'center'
        prompt_align = "left",

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        border = "rounded",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- the min_ and max_ options can be used to constrain the size of the window
        relative = "editor",
        prefer_width = 40,
        width = nil,
        max_width = 0.9,
        min_width = 10,
        height = nil,
        max_height = 0.9,
        min_height = 3,

        -- The same as the Telescope layout_config
        layout_config = nil,

        -- Set to `false` to disable
        title = nil,
        title_pos = "center",

        -- Set to `false` to disable
        info = nil,

        -- see :help dressing_input_hl
        override = function(conf) -- (Optional) Override the configuration for a specific input
          -- conf: a table with the input configuration
          -- returns: a table with the input configuration
          return conf
        end,

        -- see :help dressing_get_input
        get_config = nil,
      },

      select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.ui.select backends
        -- The first available backend will be used
        -- backends = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        backends = { "telescope", "builtin" },

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Options for telescope backend
        telescope = {
          -- can be a theme object or a function that returns a theme object
          theme = "dropdown",
        },

        -- Options for fzf_lua backend
        fzf_lua = {
          -- fzf_lua options
        },

        -- Options for fzf backend
        fzf = {
          -- fzf options
        },

        -- Options for nui backend
        nui = {
          -- nui options
        },

        -- Options for builtin backend
        builtin = {
          -- These are passed to nvim_open_win
          border = "rounded",

          -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- the min_ and max_ options can be used to constrain the size of the window
          relative = "editor",
          prefer_width = 40,
          width = nil,
          max_width = 0.9,
          min_width = 10,
          height = nil,
          max_height = 0.9,
          min_height = 3,

          -- Set to `false` to disable
          title = nil,
          title_pos = "center",

          -- Set to `false` to disable
          info = nil,
        },

        -- see :help dressing_select_hl
        override = function(conf) -- (Optional) Override the configuration for a specific select
          -- conf: a table with the select configuration
          -- returns: a table with the select configuration
          return conf
        end,

        -- see :help dressing_get_select
        get_config = nil,
      },
    })
  end,
}