---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      require "none-ls.formatting.ruff",
      require "none-ls.formatting.ruff_format",
      -- require "null-ls.builtins.diagnostics.mypy",
    })
  end,
}