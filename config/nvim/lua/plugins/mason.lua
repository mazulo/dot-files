return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
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
        -- "mypy",
        "ty",
        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
