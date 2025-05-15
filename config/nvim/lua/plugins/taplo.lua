return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "taplo")
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      taplo = {
        filetypes = { "toml" },
        root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
      },
    })
  end,
}
