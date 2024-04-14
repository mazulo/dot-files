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

-------------------------------- telescope extensions
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "telescope-tabs")
end
require('telescope-tabs').setup({
	entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
		local entry_string = table.concat(vim.tbl_map(function(v)
			return vim.fn.fnamemodify(v, ":.")
		end, file_paths), ', ')
		return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
	end
})
