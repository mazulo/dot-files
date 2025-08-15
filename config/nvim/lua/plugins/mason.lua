return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "lua-language-server",
        "cmake-language-server",
        "bash-language-server",
        "eslint-lsp",
        "ruff",
        "taplo",
        "typescript-language-server",
        "yaml-language-server",
        -- install formatters and linters
        "stylua",
        "prettier",
        "mypy",
        -- "ty",
        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
