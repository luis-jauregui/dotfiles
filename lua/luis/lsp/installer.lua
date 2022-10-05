local M = {}

function M.setup(servers, options)

  local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
  if not ok_lspconfig then
    return
  end

  local ok_mason, mason = pcall(require, "mason")
  if not ok_mason then
    return
  end

  mason.setup {
    ui = {
      icons = {
        package_installed   = "✓",
        package_pending     = "➜",
        package_uninstalled = "✗"
      }
    }
  }

  require("mason-tool-installer").setup {
    -- ensure_installed = { "eslint_d" },
    auto_update = false,
    run_on_start = true
  }

  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false
  }

  require("mason-lspconfig").setup_handlers {

    function(server_name)
      local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup(opts)
    end,

    ["sumneko_lua"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
      lspconfig.sumneko_lua.setup(require("lua-dev").setup { lspconfig = opts })
    end,

    ["tsserver"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
      require("typescript").setup {
        disable_commands = false,
        debug = false,
        server = opts,
      }
    end

  }
end

return M
