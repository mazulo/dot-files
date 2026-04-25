return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "cmake-language-server",
        "bash-language-server",
        "eslint-lsp",
        "ruff",
        "taplo",
        "typescript-language-server",
        "yaml-language-server",
        -- formatters and linters
        "stylua",
        "prettier",
        "tree-sitter-cli",
        "json-lsp",
      },
    },
  },
}
