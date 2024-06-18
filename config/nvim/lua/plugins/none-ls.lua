---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    local notes = [[
      WARNING: You might not want to use this source.
      If you don't understand what this does, use ruff-lsp instead.
    ]]
    local methods = require "null-ls.methods"
    local h = require "null-ls.helpers"
    local FORMATTING = methods.internal.FORMATTING
    local ruff = h.make_builtin {
      name = "ruff",
      meta = {
        url = "https://github.com/astral-sh/ruff/",
        description = "An extremely fast Python linter, written in Rust.",
        notes = notes,
      },
      method = FORMATTING,
      filetypes = { "python" },
      generator_opts = {
        command = "ruff",
        args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
        to_stdin = true,
      },
      factory = h.formatter_factory,
    }
    local ruff_format = h.make_builtin {
      name = "ruff",
      meta = {
        url = "https://github.com/astral-sh/ruff/",
        description = "An extremely fast Python linter, written in Rust.",
        notes = notes,
      },
      method = FORMATTING,
      filetypes = { "python" },
      generator_opts = {
        command = "ruff",
        args = { "format", "-n", "--stdin-filename", "$FILENAME", "-" },
        to_stdin = true,
      },
      factory = h.formatter_factory,
    }

    config.sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      ruff,
      ruff_format,
    }
    return config -- return final config table
  end,
}
