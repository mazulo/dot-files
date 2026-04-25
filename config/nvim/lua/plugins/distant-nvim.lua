return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.3",
  enabled = false,
  cmd = {
    "DistantLaunch",
    "DistantOpen",
    "DistantConnect",
    "DistantInstall",
    "DistantMetadata",
    "DistantShell",
    "DistantShell",
    "DistantSystemInfo",
    "DistantClientVersion",
    "DistantSessionInfo",
    "DistantCopy",
  },
  config = function()
    require("distant"):setup {
      servers = {
        ["93.188.166.188"] = {
          -- Change the current working directory and specify
          -- a path to the distant binary on the remote machine
          cwd = "/home/mazulo/dev/grabber/",
          launch = {
            bin = "/home/mazulo/.local/bin/distant",
            default = {
              username = "mazulo",
              options = "identity_files=~/.ssh/id_ed25519",
            },
          },
          connect = {
            default = {
              username = "mazulo",
              options = "identity_files=~/.ssh/id_ed25519",
            },
          },
        },
      },
    }
  end,
}
