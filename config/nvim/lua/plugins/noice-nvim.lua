return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = function(_, opts)
    local utils = require "astrocore"
    return utils.extend_tbl(opts, {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = utils.is_available "inc-rename.nvim",
        lsp_doc_border = false,
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
        position = {
          row = "auto",
          col = "auto",
        },
        size = {
          width = 120,
          height = "auto",
        },
        border = {
          style = "double",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = {
            Normal = "NoicePopupmenu",
            FloatBorder = "NoicePopupmenuBorder",
            CursorLine = "NoicePopupmenuSelected",
            PmenuMatch = "NoicePopupmenuMatch",
          },
        },
      },
      cmdline = {
        view = "cmdline_popup",
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
        if not opts.defaults then opts.defaults = {} end
        -- TODO: remove lsp_handlers when dropping support for AstroNvim v4
        if not opts.lsp_handlers then opts.lsp_handlers = {} end
        if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
          opts.defaults.hover = false
          opts.lsp_handlers["textDocument/hover"] = false
        end
        if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
          opts.defaults.signature_help = false
          opts.lsp_handlers["textDocument/signatureHelp"] = false
          if not opts.features then opts.features = {} end
          opts.features.signature_help = false
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
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { noice = true } },
    },
    {
      "folke/tokyonight.nvim",
      optional = true,
      opts = {
        plugins = {
          noice = true,
          snacks = true,
        },
      },
    },
    {
      "heirline.nvim",
      optional = true,
      opts = function(_, opts)
        local noice_opts = require("astrocore").plugin_opts "noice.nvim"
        if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then
          opts.statusline[9] = require("astroui.status").component.lsp { lsp_progress = false }
        end
      end,
    },
  },
}
