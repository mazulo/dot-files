-------------------------------- nvim-treesitter-context
require("treesitter-context").setup({
  enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      'class',
      'function',
      'method',
    },
  },
})

-------------------------------- triptych
require('triptych').setup()

-------------------------------- nvim-web-devicons
require("nvim-web-devicons").setup()
require("nvim-web-devicons").get_icons()

-------------------------------- swenv
require("swenv").setup({
  -- Should return a list of tables with a `name` and a `path` entry each.
  -- Gets the argument `venvs_path` set below.
  -- By default just lists the entries in `venvs_path`.
  get_venvs = function(venvs_path)
    return require('swenv.api').get_venvs(venvs_path)
  end,
  -- Path passed to `get_venvs`.
  venvs_path = vim.fn.expand('~/.virtualenvs/'),
  -- Something to do after setting an environment, for example call vim.cmd.LspRestart
  post_set_venv = function()
    vim.cmd("LspRestart")
  end
})

-------------------------------- goto-preview
require('goto-preview').setup({
  width = 120, -- Width of the floating window
  height = 15, -- Height of the floating window
  border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
  default_mappings = false, -- Bind default mappings
  debug = false, -- Print debug information
  opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
  post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
  references = { -- Configure the telescope UI for slowing the references cycling window.
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
  },
  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  focus_on_open = true,                                        -- Focus the floating window when opening it.
  dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
  force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
  stack_floating_preview_windows = true,                       -- Whether to nest floating windows
  preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
})
vim.keymap.set(
  "n",
  "gp",
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { noremap = true }
)
vim.keymap.set(
  "n",
  "gP",
  "<cmd>lua require('goto-preview').close_all_win()<CR>",
  { noremap = true }
)

-------------------------------- telescope trouble
local trouble = require("trouble.providers.telescope")
lvim.builtin.telescope.defaults.mappings = {
  i = { ["<c-t>"] = trouble.open_with_trouble },
  n = { ["<c-t>"] = trouble.open_with_trouble },
}

-------------------------------- telescope extensions
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "telescope-tabs")
  pcall(telescope.load_extension, "persisted")
end
require('telescope-tabs').setup({
  entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
    local entry_string = table.concat(vim.tbl_map(function(v)
      return vim.fn.fnamemodify(v, ":.")
    end, file_paths), ', ')
    return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
  end
})

-------------------------------- persisted
require("persisted").setup({
  save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
  silent = false,                                                    -- silent nvim message when sourcing session file
  use_git_branch = false,                                            -- create session files based on the branch of a git enabled repository
  default_branch = "main",                                           -- the branch to load if a session file is not found for the current branch
  autosave = true,                                                   -- automatically save session files when exiting Neovim
  should_autosave = nil,                                             -- function to determine if a session should be autosaved
  autoload = true,                                                   -- automatically load the session for the cwd on Neovim startup
  on_autoload_no_session = nil,                                      -- function to run when `autoload = true` but there is no session to load
  follow_cwd = false,                                                -- change session file name to match current working directory if it changes
  allowed_dirs = nil,                                                -- table of dirs that the plugin will auto-save and auto-load from
  ignored_dirs = nil,                                                -- table of dirs that are ignored when auto-saving and auto-loading
  ignored_branches = nil,                                            -- table of branch patterns that are ignored for auto-saving and auto-loading
  telescope = {
    reset_prompt = true,                                             -- Reset the Telescope prompt after an action?
    mappings = {                                                     -- table of mappings for the Telescope extension
      change_branch = "<c-b>",
      copy_session = "<c-c>",
      delete_session = "<c-d>",
    },
  },
})
lvim.builtin.telescope.extensions.persisted = { layout_config = { width = 0.55, height = 0.55 } }
vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"

-- bufferline
vim.opt.termguicolors = true
local bufferline = require("bufferline")
lvim.builtin.bufferline.options = {
  diagnostics = "nvim_lsp",
  mode = "buffers",
  style_preset = bufferline.style_preset.default,
  themable = true,
  numbers = "ordinal",
  close_command = "bd | vsplit | bn %d",
  right_mouse_command = "bd | vsplit | bn %d",
  left_mouse_command = "buffer %d",
  middle_mouse_command = nil,
  indicator = {
    icon = '▎',
    style = 'icon',
  },
  buffer_close_icon = '󰅖',
  modified_icon = '●',
  close_icon = '',
  left_trunc_marker = '',
  right_trunc_marker = '',
  max_name_length = 18,
  max_prefix_length = 15,
  truncate_names = true,
  tab_size = 18,
  diagnostics_update_in_insert = false,
  diagnostics_indicator = function(count, level)
    local icon = level:match("error") and " " or ""
    return " " .. icon .. count
  end,
  offsets = {
    {
      filetype = "NvimTree",
      text = "File Explorer",
      text_align = "center",
      separator = true
    }
  },
  color_icons = true,
  get_element_icon = function(element)
    -- element consists of {filetype: string, path: string, extension: string, directory: string}
    -- This can be used to change how bufferline fetches the icon
    -- for an element e.g. a buffer or a tab.
    -- e.g.
    local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    return icon, hl
  end,
  show_buffer_icons = true,
  show_buffer_close_icons = true,
  show_close_icon = true,
  show_tab_indicators = true,
  show_duplicate_prefix = true,
  persist_buffer_sort = true,
  separator_style = "slant",
  enforce_regular_tabs = false,
  always_show_bufferline = true,
  hover = {
    enabled = true,
    delay = 200,
    reveal = { 'close' }
  },
  sort_by = 'insert_after_current',
}
