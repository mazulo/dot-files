return {
  "AstroNvim/astrolsp",
  -- we need to use the function notation to get access to the `lspconfig` module
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    -- insert "prolog_lsp" into our list of servers
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "taplo")

    -- extend our configuration table to have our new prolog server
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      -- this must be a function to get access to the `lspconfig` module
      taplo = {
        filetypes = { "toml" },
        -- root directory detection for detecting the project root
        root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
      },
    })
  end,
}
