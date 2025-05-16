return {
  "Saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  specs = {
    { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
  },
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
    },
    sources = {
      default = { "lsp", "buffer", "path", "snippets" },
      providers = {
        copilot = { score_offset = 5, name = "copilot", module = "blink.compat.source" },
        lsp = { score_offset = 3 },
        path = { score_offset = 0 },
        snippets = { score_offset = -1 },
        buffer = { score_offset = -3 },
      },
    },
    completion = {
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
      trigger = {
        prefetch_on_insert = true,
        show_on_trigger_character = true,
      },
    },
  },
}
