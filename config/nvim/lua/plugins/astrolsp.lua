---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
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
          "toml",
        },
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      yamlls = {
        on_new_config = function(config)
          config.settings.yaml.schemas =
            vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = {
              kubernetes = "/*.yaml",
            },
          },
        },
      },
    },
    taplo = {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    },
  },
  handlers = {},
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
      ["<Leader>uY"] = {
        function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        desc = "Toggle LSP semantic highlight (buffer)",
        cond = function(client)
          return client.supports_method(vim.lsp.client, "textDocument/semanticTokens/full")
            and vim.lsp.semantic_tokens ~= nil
        end,
      },
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
}
