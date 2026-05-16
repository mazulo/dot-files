return {
  {
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      opts.backends = {
        ["_"] = { "lsp", "treesitter", "markdown", "man" },
        just = { "lsp" },
      }

      return opts
    end,
  },
}
