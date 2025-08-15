return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      container = {
        enable_character_fade = false,
        width = "100%",
        right_padding = 0,
      },
      file_size = {
        enabled = true,
        required_width = 64,
      },
      type = {
        enabled = true,
        required_width = 122,
      },
      diagnostics = {
        symbols = {
          hint = "󰌵",
          info = "",
          warn = "",
          error = "",
        },
        highlights = {
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          warn = "DiagnosticSignWarn",
          error = "DiagnosticSignError",
        },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd "wincmd =" end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd "wincmd =" end
        end,
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        {
          "container",
          width = "fit_content",
          content = {
            { "name", zindex = 10 },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
          },
        },
      },
      file = {
        { "indent" },
        { "icon" },
        {
          "container",
          width = "fit_content",
          content = {
            {
              "name",
              zindex = 10,
            },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
          },
        },
      },
    },
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        visible = true,
        -- hide_dotfiles = false,
        -- hide_hidden = true,
        hide_by_name = {
          "node_modules",
          "__pycache__",
        },
        hide_by_pattern = {
          "*.meta",
          "*.pyc",
        },
        always_show = {
          ".env",
          ".envrc",
        },
        always_show_by_pattern = {
          ".github/*",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
        never_show_by_pattern = {
          ".null-ls_*",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    source_selector = {
      sources = {
        {
          source = "filesystem",
          display_name = " 󰉓 Files ",
        },
        {
          source = "buffers",
          display_name = " 󰈚 Buffers ",
        },
        {
          source = "git_status",
          display_name = " 󰊢 Git ",
        },
      },
      winbar = true, -- toggle to show selector on winbar
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      show_unloaded = true,
    },
    git_status = {
      window = {
        position = "float",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        require("window-picker").setup {
          hint = "floating-big-letter",
          selection_chars = "ASDFKL;CMRUEIWOQP",
          prompt_message = "Choose window to open the file: ",
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
          highlights = {
            statusline = {
              focused = {
                fg = "#ededed",
                bg = "#e35e4f",
                bold = true,
              },
              unfocused = {
                fg = "#ededed",
                bg = "#44cc41",
                bold = true,
              },
            },
            winbar = {
              focused = {
                fg = "#ededed",
                bg = "#e35e4f",
                bold = true,
              },
              unfocused = {
                fg = "#ededed",
                bg = "#44cc41",
                bold = true,
              },
            },
          },
        }
      end,
    },
  },
}
