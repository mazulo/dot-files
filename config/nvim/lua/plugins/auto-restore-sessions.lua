return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true,
          callback = function()
            if vim.fn.argc(-1) == 0 then
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
  },
}