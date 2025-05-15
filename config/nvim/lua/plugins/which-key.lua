return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      group = vim.g.icons_enabled ~= false and "" or "+",
      separator = "-",
    },
    disable = { filetypes = { "TelescopePrompt" } },
    operators = { gcc = "Comments" },
  },
  keys = {
    { "gc", mode = { "n" }, false },
    { "gco", mode = { "n" }, false },
    { "gcA", mode = { "n" }, false },
    { "gcO", mode = { "n" }, false },
    { "gcc", mode = { "n" }, false },
    { "gb", mode = { "n" }, false },
    { "gr", mode = { "n" }, false },
  },
}
