local keyMapper = require('utils.keyMapper').mapKey

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require('mason').setup()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
      },
    })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "tsserver", "gopls", "eslint" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.set_log_level("debug")

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.eslint.setup({})

      keyMapper('K', vim.lsp.buf.hover)
      keyMapper('gd', vim.lsp.buf.definition)
      keyMapper('<leader>dv', ':vsplit | lua vim.lsp.buf.definition()<CR>', 'n', {noremap=true, silent=true})
      keyMapper('<leader>dh', ':belowright split | lua vim.lsp.buf.definition()<CR>', 'n', {noremap=true, silent=true})
      keyMapper('<leader>ca', vim.lsp.buf.code_action)
      keyMapper('<leader>l', vim.lsp.buf.format)

    end
  },
}
