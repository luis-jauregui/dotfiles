local M = {}

local utils = require "luis.utils"
local luasnip = require "luasnip"

vim.o.completeopt = "menu,menuone,noselect"

function M.setup()

  local ok_cmp, cmp = pcall(require, "cmp")
  if not ok_cmp then
    utils.error_plugin("cmp")
    return
  end

  local ok_lspkind, lspkind = pcall(require, "lspkind")
  if not ok_lspkind then
    utils.error_plugin("lspkind")
    return
  end

  cmp.setup {

    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = cmp.mapping.preset.insert({

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),

      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      ['<C-n>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, {'i', 's'}),

      ['<C-p>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
            cmp.select_prev_item()
        end
      end, { "i", "s" }),
    }),

    window = {
      -- completion = cmp.config.window.bordered()
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    },

    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50,
      })
    },

    experimental = {
      native_menu = false,
      ghost_text = false,
    },

  }

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

end

return M
