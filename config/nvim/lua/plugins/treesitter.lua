---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    optional = true,
    opts = function(_, opts)
      require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bash",
        "c",
        "git_config",
        "gitignore",
        "just",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tmux",
        "vim",
        "vimdoc",
        "yaml",
        "json",
      })
    end,
  },
}
