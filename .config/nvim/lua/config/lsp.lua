-- Mason.nvim
require('mason').setup({
  check_outdated_packages_on_open = true,
  border = "rounded",
  width = .7,
  height = .4,
  ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
})


require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'gopls',
    'eslint',
    'emmet_ls',
  }
})

-- nvim_cmp_lsp
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    }),
    sources = cmp.config.sources({
    { name = 'copilot', group_index = 2},
    {name = 'path', group_index = 2},
    {name = 'nvim_lsp', group_index = 2},
    {name = 'buffer', keyword_length = 3},
    {name = 'vsnip', keyword_length = 2, group_index = 2},
    })
  })
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Nvim-lspconfig
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

-- Copilot play nice
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

