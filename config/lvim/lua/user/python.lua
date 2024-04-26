vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers,
  { "pyright", "jsonls" }
)

-- setup formatting
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "ruff",
    filetypes = { "python" },
  },
})

-- setup linting
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "ruff",
    filetypes = { "python" },
  },
})

-- binding for env switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local util = require("lspconfig/util")

local pyright_opts = {
  on_attach = on_attach,
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = true,
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly", -- openFilesOnly, workspace
        typeCheckingMode = "off",         -- off, basic, strict
        useLibraryCodeForTypes = true,
      },
    },
  },
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
        or util.path.dirname(fname)
  end,
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)
