---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
    enabled = false,
  },
  { "echasnovski/mini.icons", version = "*" },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = {
        enabled = true,
        size = 10 * 1024 * 1024, -- 10MB
      },
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
          relative = "editor",
        },
        help = {
          position = "float",
          relative = "editor",
          backdrop = false,
          border = "top",
          row = -1,
          width = 0,
          height = 0.3,
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
              require("snacks").notify.warn "No file under cursor"
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
          hidden = true,
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
        sort = {
          -- default sort is by score, text length and index
          fields = { "score:desc", "#text", "idx" },
        },
        ui_select = true,
        previewers = {
          diff = {
            builtin = true, -- use Neovim for previewing diffs (true) or use an external tool (false)
            cmd = { "delta" }, -- example to show a diff with delta
          },
          git = {
            builtin = true, -- use Neovim for previewing git output (true) or use git (false)
            args = {}, -- additional arguments passed to the git command. Useful to set pager options usin `-c ...`
          },
          file = {
            max_size = 10 * 1024 * 1024, -- 10MB,
            max_line_length = nil,
            ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
          },
          man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
        },
        ---@class snacks.picker.jump.Config
        jump = {
          jumplist = true, -- save the current position in the jumplist
          tagstack = true, -- save the current position in the tagstack
          reuse_win = false, -- reuse an existing window if the buffer is already open
          close = false, -- close the picker when jumping/editing to a location (defaults to true)
          match = false, -- jump to the first match position. (useful for `lines`)
        },
        toggles = {
          follow = "f",
          hidden = "h",
          ignored = "i",
          modified = "m",
          regex = { icon = "R", value = false },
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
          focus = "list",
          jump = { close = false },
          layout = { preset = "sidebar", preview = false },
          -- to show the explorer to the right, add the below to
          -- your config under `opts.picker.sources.explorer`
          -- layout = { layout = { position = "right" } },
          formatters = {
            file = { filename_only = true },
            severity = { pos = "right" },
          },
          matcher = { sort_empty = false, fuzzy = false },
          config = function(opts) return require("snacks.picker.source.explorer").setup(opts) end,
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
      { "<leader><space>", function() require("snacks").picker.smart() end, desc = "Smart Find Files" },
      { "<leader>,", function() require("snacks").picker.buffers() end, desc = "Buffers" },
      { "<leader>\\", function() require("snacks").picker.grep() end, desc = "Grep" },
      { "<leader>:", function() require("snacks").picker.command_history() end, desc = "Command History" },
      { "<leader>n", function() require("snacks").picker.notifications() end, desc = "Notification History" },
      { "<leader>E", function() require("snacks").explorer() end, desc = "File Explorer" },
      -- find
      { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
      {
        "<leader>fc",
        function() require("snacks").picker.files { cwd = vim.fn.stdpath "config" } end,
        desc = "Find Config File",
      },
      { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() require("snacks").picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() require("snacks").picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent" },
      -- git
      { "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      { "<leader>sb", function() require("snacks").picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sB", function() require("snacks").picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function() require("snacks").picker.grep() end, desc = "Grep" },
      {
        "<leader>sw",
        function() require("snacks").picker.grep_word() end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      { '<leader>s"', function() require("snacks").picker.registers() end, desc = "Registers" },
      { "<leader>s/", function() require("snacks").picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() require("snacks").picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sc", function() require("snacks").picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() require("snacks").picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() require("snacks").picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() require("snacks").picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() require("snacks").picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() require("snacks").picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() require("snacks").picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() require("snacks").picker.loclist() end, desc = "Location List" },
      { "<leader>sm", function() require("snacks").picker.marks() end, desc = "Marks" },
      { "<leader>sM", function() require("snacks").picker.man() end, desc = "Man Pages" },
      { "<leader>sp", function() require("snacks").picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sq", function() require("snacks").picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sR", function() require("snacks").picker.resume() end, desc = "Resume" },
      { "<leader>su", function() require("snacks").picker.undo() end, desc = "Undo History" },
      { "<leader>uC", function() require("snacks").picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>sy", function() require("snacks").picker.cliphist() end, desc = "Search clipboard history" },
      -- Others
      { "<leader>st", function() require("snacks").terminal() end, desc = "Toggle Terminal" },
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
}
