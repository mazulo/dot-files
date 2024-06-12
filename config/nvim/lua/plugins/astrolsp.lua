---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = false,
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "lua",
        },
        ignore_filetypes = {
          "python",
        },
      },
      disabled = {
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000,
    },
    servers = {
      -- "pyright"
    },
    ---@diagnostic disable: missing-fields
    config = {},
    handlers = {
      pyright = function(_, opts)
        local util = require "lspconfig/util"
        local pyright_opts = {
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
            return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
              or util.path.dirname(fname)
          end,
        }
        local function tableMerge(result, ...)
          for _, t in ipairs { ... } do
            for _, v in ipairs(t) do
              table.insert(result, v)
            end
          end
        end
        local opts_merged = {}
        tableMerge(opts_merged, opts, pyright_opts)
        require("lspconfig").pyright.setup(opts_merged)
      end,
    },
    autocmds = {
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        {
          event = { "CursorHold", "CursorHoldI" },
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },
    },
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        x = { '"_x' },
        d = { '"_d' },
        D = { '"_D' },
        p = { '"_dP' },
        y = { '"+y' },
        Y = { '"+y$' },
      },
      v = {
        x = { '"_x' },
        d = { '"_d' },
        D = { '"_D' },
        y = { '"+y' },
      },
    },
  },
}
