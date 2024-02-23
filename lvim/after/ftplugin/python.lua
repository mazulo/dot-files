vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2

local util = require("lspconfig/util")
-- Advanced pyright configuration
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })local pyright_opts = {
    single_file_support = true,
    settings = {
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false,
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly", -- openFilesOnly, workspace
                typeCheckingMode = "off", -- off, basic, strict
                useLibraryCodeForTypes = true,
            },
        },
    },
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
        util.path.dirname(fname)
    end
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)