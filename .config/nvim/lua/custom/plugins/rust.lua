return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'Saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        config = true,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require 'cmp'
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = 'crates', priority = 750 },
      }))
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'simrat39/rust-tools.nvim' },
    opts = {
      -- make sure mason installs the server
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function(_, opts)
          require('lazyvim.util').lsp.on_attach(function(client, buffer)
            if client.name == 'rust_analyzer' then
              vim.keymap.set('n', 'K', '<cmd>RustHoverActions<cr>', { buffer = buffer, desc = 'Hover Actions (Rust)' })
              vim.keymap.set('n', '<leader>cR', '<cmd>RustCodeAction<cr>', { buffer = buffer, desc = 'Code Action (Rust)' })
              vim.keymap.set('n', '<leader>dr', '<cmd>RustDebuggables<cr>', { buffer = buffer, desc = 'Run Debuggables (Rust)' })
            end
          end)
          local mason_registry = require 'mason-registry'
          -- rust tools configuration for debugging support
          local codelldb = mason_registry.get_package 'codelldb'
          local extension_path = codelldb:get_install_path() .. '/extension/'
          local codelldb_path = extension_path .. 'adapter/codelldb'
          local liblldb_path = vim.fn.has 'mac' == 1 and extension_path .. 'lldb/lib/liblldb.dylib' or extension_path .. 'lldb/lib/liblldb.so'
          local rust_tools_opts = vim.tbl_deep_extend('force', opts, {
            dap = {
              adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
            },
            tools = {
              on_initialized = function()
                vim.cmd [[
                  augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                  augroup END
                ]]
              end,
            },
            server = {
              settings = {
                ['rust-analyzer'] = {
                  cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                  },
                  -- Add clippy lints for Rust.
                  checkOnSave = {
                    allFeatures = true,
                    command = 'clippy',
                    extraArgs = { '--no-deps' },
                  },
                  procMacro = {
                    enable = true,
                    ignored = {
                      ['async-trait'] = { 'async_trait' },
                      ['napi-derive'] = { 'napi' },
                      ['async-recursion'] = { 'async_recursion' },
                    },
                  },
                },
              },
            },
          })
          require('rust-tools').setup(rust_tools_opts)
          return true
        end,
      },
    },
  },
}
