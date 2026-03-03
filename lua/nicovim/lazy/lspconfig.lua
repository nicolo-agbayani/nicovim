return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
    },

    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        vim.keymap.set("n", "gdd", require("telescope.builtin").lsp_definitions, { buffer = event.buf, desc = "Go to definition"})
        vim.keymap.set("n", "gdr", require("telescope.builtin").lsp_references, { buffer = event.buf, desc = "Go to references"})
        vim.keymap.set("n", "gdi", require("telescope.builtin").lsp_implementations, { buffer = event.buf, desc = "Go to implementation"})
        vim.keymap.set("n", "gdt", require("telescope.builtin").lsp_type_definitions, { buffer = event.buf, desc = "Go to type implementation"})

        vim.keymap.set("n", "<leader>cs", require("telescope.builtin").lsp_document_symbols, { buffer = event.buf, desc = "Document symbols"})
        vim.keymap.set("n", "<leader>cS", require("telescope.builtin").lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = "Workspace symbols"})

        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename"})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Action"})
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { buffer = event.buf, desc = "View Diagnostic"})

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover Documentation"})

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go to Declaration"})

        -- Add automatic highlight on hover
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.keymap.set("n", "<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, { buffer = event.buf, desc = "Toggle Inlay Hints"})
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    local servers = {
      lua_ls = {},
    }

    require("mason").setup {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "\u{25cf}",
          package_pending = "\u{25cf}",
          package_uninstalled = "\u{25cb}",
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
    })

    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.INFO] = "\u{f29f}",
          [vim.diagnostic.severity.HINT] = "\u{f29f}",
          [vim.diagnostic.severity.WARN] = "\u{f29f}",
          [vim.diagnostic.severity.ERROR] = "\u{f29f}",
        },
        numhl = {
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
          [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
          [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        },
      },
    })
  end,
}
