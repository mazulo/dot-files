---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    config.sources = {
      require "none-ls.formatting.ruff",
      require "none-ls.formatting.ruff_format",
    }
    return config
  end,
}
