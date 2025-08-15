---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  {
    import = "astrocommunity.utility.noice-nvim",
    opts = function(_, opts)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
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
  },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
}
