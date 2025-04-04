return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = function(_, opts)
    local utils = require "astrocore"
    return utils.extend_tbl(opts, {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
        inc_rename = false,
      },
      views = {
        cmdline_popup = {
          position = {
            row = 35,
            col = "50%",
          },
          size = {
            width = 80,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 38,
            col = "50%",
          },
          size = {
            width = 80,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "NormalFloat", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      popupmenu = {
        -- relative = 'editor', -- "'cursor'"|"'editor'"|"'win'"
        position = {
          row = "auto", -- Popup will show up below the cmdline automatically
          col = "auto",
        },
        size = {
          width = 120, -- Making this as wide as the cmdline_popup
          height = "auto",
        },
        border = {
          style = "double", -- 'double'"|"'none'"|"'rounded'"|"'shadow'"|"'single'"|"'solid'
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = {
            Normal = "NoicePopupmenu", -- Normal | NoicePopupmenu
            FloatBorder = "NoicePopupmenuBorder", -- DiagnosticInfo | NoicePopupmenuBorder
            CursorLine = "NoicePopupmenuSelected",
            PmenuMatch = "NoicePopupmenuMatch",
          },
        },
      },
      cmdline = {
        view = "cmdline_popup", -- cmdline_popup, cmdline
      },
    })
  end,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "bash", "markdown", "markdown_inline", "regex", "vim" }
          )
        end
      end,
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@param opts AstroLSPOpts
      opts = function(_, opts)
        local noice_opts = require("astrocore").plugin_opts "noice.nvim"
        -- disable the necessary handlers in AstroLSP
        if not opts.lsp_handlers then opts.lsp_handlers = {} end
        if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
          opts.lsp_handlers["textDocument/hover"] = false
        end
        if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
          opts.lsp_handlers["textDocument/signatureHelp"] = false
          if not opts.features then opts.features = {} end
          opts.features.signature_help = false
        end
      end,
    },
    {
      "heirline.nvim",
      optional = true,
      opts = function(_, opts)
        local noice_opts = require("astrocore").plugin_opts "noice.nvim"
        if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then -- check if lsp progress is enabled
          opts.statusline[9] = require("astroui.status").component.lsp { lsp_progress = false }
        end
      end,
    },
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.bottom then opts.bottom = {} end
        table.insert(opts.bottom, {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        })
      end,
    },
    {
      "folke/tokyonight.nvim",
      optional = true,
      opts = {
        plugins = {
          noice = true,
          telescope = false,
          treesitter = true,
          notify = true,
          cmp = true,
        },
      },
    },
  },
}
