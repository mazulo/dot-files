return {
  {
    "mfussenegger/nvim-lint",
    config = function(_, _)
      local lint = require "lint"
      local pattern = "([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*)"
      local groups = { "file", "lnum", "col", "end_lnum", "end_col", "severity", "message" }
      local severities = {
        error = vim.diagnostic.severity.ERROR,
        warning = vim.diagnostic.severity.WARN,
        note = vim.diagnostic.severity.HINT,
      }

      lint.linters_by_ft = {
        python = { "mypy" },
      }
      lint.linters.mypy = {
        cmd = "mypy",
        stdin = false,
        ignore_exitcode = true,
        args = {
          "--show-column-numbers",
          "--show-error-end",
          "--show-error-codes",
          -- "--hide-error-context",
          "--no-color-output",
          "--no-error-summary",
          "--no-pretty",
          "--python-executable",
          function()
            local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
            return virtual .. "/bin/python" or vim.fn.exepath "python"
          end,
        },
        parser = require("lint.parser").from_pattern(
          pattern,
          groups,
          severities,
          { ["source"] = "mypy" },
          { end_col_offset = 0 }
        ),
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({
        "BufEnter", -- trigger whenever we open a new buffer or we move the cursor into another buffer
        "BufWritePost", -- trigger whenever we save a buffer
        "InsertLeave", -- trigger whenever we leave insert mode
        "TextChanged",
      }, {
        group = lint_augroup,
        callback = function() -- will trigger when any of the above events are triggered
          lint.try_lint() -- the lint plugin which we loaded will try to execute linting
        end,
      })
    end,
  },
}
