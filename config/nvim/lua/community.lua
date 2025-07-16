---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.search.nvim-spectre" },
  {
    import = "astrocommunity.editing-support.ultimate-autopair-nvim",
    opts = {
      internal_pairs = {
        { "[", "]", fly = true, dosuround = true, newline = true, space = true },
        { "(", ")", fly = true, dosuround = true, newline = true, space = true },
        { "{", "}", fly = true, dosuround = true, newline = true, space = true },
        { '"', '"', suround = true, multiline = false },
        {
          "'",
          "'",
          suround = true,
          cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
          alpha = true,
          nft = { "tex" },
          multiline = false,
        },
        {
          "`",
          "`",
          cond = function(fn) return not fn.in_lisp() or fn.in_string() end,
          nft = { "tex" },
          multiline = false,
        },
        { "``", "''", ft = { "tex" } },
        { "```", "```", newline = true, ft = { "markdown" } },
        { "<!--", "-->", ft = { "markdown", "html" }, space = true },
        { '"""', '"""', newline = true, ft = { "python" } },
        { "'''", "'''", newline = true, ft = { "python" } },
      },
    },
  },
}
