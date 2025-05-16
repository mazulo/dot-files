---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "echasnovski/mini.icons", version = "*" },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      styles = {
        float = {
          position = "float",
          backdrop = 60,
          height = 0.9,
          width = 0.9,
          zindex = 50,
        },
      },
      terminal = {
        win = { style = "float" },
        bo = {
          filetype = "snacks_terminal",
        },
        wo = {},
        keys = {
          q = "hide",
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand "<cfile>", "**")
            if f == "" then
              Snacks.notify.warn "No file under cursor"
            else
              self:hide()
              vim.schedule(function() vim.cmd("e " .. f) end)
            end
          end,
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd "stopinsert"
              else
                self.esc_timer:start(200, 0, function() end)
                return "<esc>"
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      },
      picker = {
        enabled = true,
        files = {
          finder = "files",
          format = "file",
          show_empty = true,
          hidden = false,
          ignored = true,
          follow = false,
          supports_live = true,
        },
        matcher = {
          fuzzy = true, -- use fuzzy matching
          smartcase = true, -- use smartcase
          ignorecase = false, -- use ignorecase
          sort_empty = false, -- sort results when the search string is empty
          filename_bonus = true, -- give bonus for matching file names (last part of the path)
          file_pos = true, -- support patterns like `file:line:col` and `file:line`
          -- the bonusses below, possibly require string concatenation and path normalization,
          -- so this can have a performance impact for large lists and increase memory usage
          cwd_bonus = false, -- give bonus for matching files in the cwd
          frecency = false, -- frecency bonus
          history_bonus = false, -- give more weight to chronological order
        },
        cliphist = {
          finder = "system_cliphist",
          format = "text",
          preview = "preview",
          confirm = { "copy", "close" },
        },
        explorer = {
          tree = false,
          auto_close = false,
          diagnostics = true,
          finder = "explorer",
          follow_file = true,
          git_untracked = true,
          sort = { fields = { "sort" } },
          supports_live = true,
          watch = true,
        },
        grep = {
          finder = "grep",
          regex = true,
          format = "file",
          show_empty = true,
          live = true, -- live grep by default
          supports_live = true,
          hidden = true,
        },
        lsp_declarations = {
          finder = "lsp_declarations",
          format = "file",
          include_current = false,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
        lsp_definitions = {
          finder = "lsp_definitions",
          format = "file",
          include_current = false,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
        lsp_implementations = {
          finder = "lsp_implementations",
          format = "file",
          include_current = false,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
        lsp_references = {
          finder = "lsp_references",
          format = "file",
          include_declaration = true,
          include_current = false,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
        lsp_symbols = {
          finder = "lsp_symbols",
          format = "lsp_symbol",
          tree = true,
          filter = {
            default = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              "Property",
              "Struct",
              "Trait",
            },
            -- set to `true` to include all symbols
            markdown = true,
            help = true,
            -- you can specify a different filter for each filetype
            lua = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              -- "Package", -- remove package since luals uses it for control flow structures
              "Property",
              "Struct",
              "Trait",
            },
          },
        },
        lsp_type_definitions = {
          finder = "lsp_type_definitions",
          format = "file",
          include_current = false,
          auto_confirm = true,
          jump = { tagstack = true, reuse_win = true },
        },
        notifications = {
          finder = "snacks_notifier",
          format = "notification",
          preview = "preview",
          formatters = { severity = { level = true } },
          confirm = "close",
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>\\", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer" },
      -- find
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fc", function() Snacks.picker.files { cwd = vim.fn.stdpath "config" } end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      {
        "<leader>sw",
        function() Snacks.picker.grep_word() end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>sy", function() Snacks.picker.cliphist() end, desc = "Search clipboard history" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Others
      { "<leader>st", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
  },
  {
    "folke/trouble.nvim",
    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
            win = {
              input = {
                keys = {
                  ["<c-t>"] = {
                    "trouble_open",
                    mode = { "n", "i" },
                  },
                },
              },
            },
          },
          -- modes = {
          --   preview_float = {
          --     mode = "diagnostics",
          --     preview = {
          --       type = "float",
          --       relative = "editor",
          --       border = "rounded",
          --       title = "Preview",
          --       title_pos = "center",
          --       position = { 0, -2 },
          --       size = { width = 0.3, height = 0.3 },
          --       zindex = 200,
          --     },
          --   },
          -- },
        })
      end,
    },
  },
  {
    "folke/edgy.nvim",
    ---@module 'edgy'
    ---@param opts Edgy.Config
    opts = function(_, opts)
      for _, pos in ipairs { "top", "bottom", "left", "right" } do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "snacks_terminal",
          size = { height = 0.4 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end
    end,
  },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
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
              { "clipboard", zindex = 10 },
              { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
              { "git_status", zindex = 10, align = "right", hide_when_expanded = true },
              { "file_size", zindex = 10, align = "right" },
              { "type", zindex = 10, align = "right" },
              { "last_modified", zindex = 10, align = "right" },
              { "created", zindex = 10, align = "right" },
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
              { "clipboard", zindex = 10 },
              { "bufnr", zindex = 10 },
              { "modified", zindex = 20, align = "right" },
              { "diagnostics", zindex = 20, align = "right" },
              { "git_status", zindex = 10, align = "right" },
              { "file_size", zindex = 10, align = "right" },
              { "type", zindex = 10, align = "right" },
              { "last_modified", zindex = 10, align = "right" },
              { "created", zindex = 10, align = "right" },
            },
          },
        },
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_hidden = true,
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
            --".env*",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = {
            --".null-ls_*",
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
            prompt_message = "Pick window: ",
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
  },

  {
    "towolf/vim-helm",
    ft = "helm",
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require "lspconfig"
      lspconfig.helm_ls.setup {
        capabilities = capabilities,
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        },
      }
    end,
  },
  {
    "overleaf/vim-env-syntax",
    ft = "env",
    enabled = true,
  },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
