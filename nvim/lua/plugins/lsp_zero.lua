local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'jdtls', 'rust_analyzer', 'clangd', 'lua_ls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    pylsp = function()
        require('lspconfig').pylsp.setup({
            pylsp = {
                pylps = {
                    plugins = {
                        flake8 = {
                            ignore = {'E203'}
                        }
                    }
                }
            }
        })
    end,
  },
})
