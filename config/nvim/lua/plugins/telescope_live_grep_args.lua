return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        {
          "nvim-telescope/telescope-live-grep-args.nvim",
          -- This will not install any breaking changes.
          -- For major updates, this must be adjusted manually.
          version = "^1.1.0",
        },
      },
      opts = function() require("telescope").load_extension "live_grep_args" end,
    },
  },
}
