vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })

-- print(vim.api.nvim_buf_get_name(0))
local path = vim.api.nvim_buf_get_name(0)
local parts = vim.split(path, "/")
local filename = parts[#parts]
-- print(filename)

-- check if ansidble is in file extension
if string.find(filename, "ansible") then
  require("lvim.lsp.manager").setup("ansiblels", {})
else
  require("lvim.lsp.manager").setup("yamlls", {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
  ["yamlls"] = function()
    require("lspconfig").yamlls.setup {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            kubernetes = "/*.yaml",
            -- Add the schema for gitlab piplines
            -- ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.yml",
          },
        },
      },
    }
  end,
}
