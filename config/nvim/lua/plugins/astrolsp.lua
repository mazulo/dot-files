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
          capabilities = {
            textDocument = {
              publishDiagnostics = {
                tagSupport = {
                  valueSet = { 2 },
                },
              },
            },
          },
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
              disableTaggedHints = true, -- Using Ruff
            },
            python = {
              analysis = {
                ignore = { "*" }, -- Using Ruff
                diagnosticSeverityOverrides = {
                  reportUndefinedVariable = "none",
                },
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
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
      },
    },
  },
  on_attach = function(client, _)
    if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end
  end,
}
