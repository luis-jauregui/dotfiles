local M = {}

function M.setup()

  local packer_boostrap = false

  local function packer_init()

    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then

      print("installing packer ...")

      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd [[packadd packer.nvim]]

      print("packer installed ...")

      packer_boostrap = true

    end
  end

  local function plugins(use)

    use { "wbthomason/packer.nvim" }

    use { "nvim-lua/plenary.nvim", module = "plenary" }

    use {
      "goolord/alpha-nvim",
      config = function ()
        require("luis.config.alpha").setup()
      end
    }

    use {
      "max397574/better-escape.nvim",
      event  = { "InsertEnter" },
      config = function()
        require("better_escape").setup {
          mapping = { "jj" },
          timeout = vim.o.timeoutlen,
          keys    = "<ESC>",
        }
      end,
    }

    use {
      "tyru/open-browser.vim",
      opt     = true,
      keys    = [[C-b]],
      event   = "BufReadPre",
      cmd     = { "OpenBrowser", "OpenBrowserSearch" },
      disable = false
    }

    -- LSP

    use {
      "neovim/nvim-lspconfig",
      opt   = true,
      event = { "BufReadPre" },
      wants = {
        "null-ls.nvim",
        "mason.nvim",
        "mason-tool-installer.nvim",
        "mason-lspconfig.nvim",
        "neodev.nvim",
        "typescript.nvim",
        "nvim-navic",
        "symbols-outline.nvim",
      },
      config   = function()
        require("luis.lsp").setup()
      end,
      requires = {
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "folke/neodev.nvim",
        "jose-elias-alvarez/typescript.nvim",
        {
          "ray-x/lsp_signature.nvim",
          config = function()
            require("luis.config.lsp_signature").setup()
          end
        },
        {
          "SmiteshP/nvim-navic",
          config = function ()
            require("nvim-navic").setup()
          end
        },
        {
          "simrat39/symbols-outline.nvim",
          config = function()
            require("symbols-outline").setup()
          end,
          disable = false,
        }
      },
    }

    use {
      "iamcco/markdown-preview.nvim",
      run      = function() vim.fn["mkdp#util#install"]() end,
      ft       = "markdown",
      cmd      = { "MarkdownPreview" },
      requires = {
        "zhaozg/vim-diagram",
        {
          "vimwiki/vimwiki",
          ft  = "vimwiki",
          cmd = { "VimwikiIndex", "VimwikiTabIndex" }
        }
      }
    }

    use {
      "NvChad/nvim-colorizer.lua",
      ft     = { "html", "css" },
      config = function ()
        require("colorizer").setup {
          filetypes = { "html", "css" },
        }
      end
    }

    use {
      "max397574/colortils.nvim",
      opt    = true,
      ft     = { "html", "css" },
      cmd    = "Colortils",
      config = function()
        require("colortils").setup()
      end,
    }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require("luis.config.lspkind").setup()
      end
    }

    -- Refactor

    use {
      "ThePrimeagen/refactoring.nvim",
      ft     = { "javascript", "typescript" },
      event  = "BufReadPre",
      opt    = true,
      keys   = { [[<leader>r]] },
      module = { "refactoring", "telescope" },
      wants  = { "telescope.nvim" },
      config = function()
        require("luis.config.refactoring").setup()
      end,
    }

    -- Cmp

    use {
      "hrsh7th/nvim-cmp",
      event  = "InsertEnter",
      opt    = true,
      config = function ()
        require("luis.config.cmp").setup()
      end,
      wants    = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for buffer words
        "hrsh7th/cmp-buffer", -- nvim-cmp source for neovim's built-in LSP
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          config = function()
            require("luis.snippets").setup()
          end,
        },
      }
    }

    use {
      "folke/which-key.nvim",
      event  = "VimEnter",
      config = function ()
        require("luis.config.whichkey").setup()
      end
    }

    use {
      "numToStr/Comment.nvim",
      keys   = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup()
      end
    }

    -- Treesitter

    use {
      "nvim-treesitter/nvim-treesitter",
      opt    = true,
      event  = "BufRead",
      run    = ":TSUpdate",
      config = function()
        require("luis.config.treesitter").setup()
      end,
      requires = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        { "windwp/nvim-ts-autotag", event = "InsertEnter" },
        "nvim-treesitter/playground",
        { "andymass/vim-matchup", event = "CursorMoved" },
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-refactor"
      }
    }

    use {
      "windwp/nvim-ts-autotag",
      opt    = true,
      wants  = "nvim-treesitter",
      event  = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup({ enable = true })
      end,
    }

    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function ()
        require("nvim-web-devicons").setup( { default = true })
      end
    }

    use {
      "windwp/nvim-autopairs",
      opt    = true,
      event  = "InsertEnter",
      wants  = "nvim-treesitter",
      module = { "nvim-autopairs" },
      config = function ()
        require("nvim-autopairs").setup({
          disable_filetype = { "TelescopePrompt", "vim" },
          check_ts = true
        })
      end
    }

    use {
      "nvim-lualine/lualine.nvim",
      event  = "VimEnter",
      after  = "nvim-treesitter",
      config = function()
        require("luis.config.lualine").setup()
      end,
      wants = "nvim-web-devicons"
    }

    use {
      "mg979/vim-visual-multi",
      opt    = true,
      keys   = { [[<C-n>]] },
      branch = "master"
    }
    use { "tpope/vim-surround", event = "InsertEnter" }
    use { "tpope/vim-dotenv" }
    use { "tpope/vim-repeat" }
    use { "junegunn/vim-easy-align", cmd = { "EasyAlign" } }
    use { "ThePrimeagen/harpoon", disable = true }
    use { "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } }

    use {
      "akinsho/toggleterm.nvim",
      keys   = { [[<C-t>]] },
      cmd    = { "ToggleTerm", "TermExec" },
      config = function ()
        require("luis.config.terminal").setup()
      end
    }

    use {
      "akinsho/nvim-bufferline.lua",
      event  = "BufReadPre",
      tag    = "v2.*",
      wants  = "nvim-web-devicons",
      config = function ()
        require("luis.config.bufferline").setup()
      end
    }

    use {
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
        require("luis.config.lspsaga").setup()
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      opt    = true,
      wants  = "nvim-web-devicons",
      module = "nvim-tree",
      config = function()
        require("luis.config.nvimtree").setup()
      end,
    }

    -- Telescope

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-lua/popup.nvim",
        { "nvim-lua/plenary.nvim", module = "plenary" },
        "nvim-telescope/telescope-project.nvim",
        "TC72/telescope-tele-tabby.nvim",
      },
      config = function()
        require("luis.telescope").setup()
      end,
    }

    use { "stevearc/dressing.nvim" }

    -- Motion

    use { "chaoren/vim-wordmotion" }

    use {
      'phaazon/hop.nvim',
      opt = true,
      keys = { [[<space><space>]] },
      branch = 'v2',
      config = function()
        require('luis.config.hop').setup()
      end
    }
    use { "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" }, disable = false }

    use {
      "beauwilliams/focus.nvim",
      cmd    = { "FocusToggle", "FocusMaxOrEqual" },
      module = "focus",
      config = function()
        require("focus").setup { hybridnumber = false, number = false }
      end,
      disable = false,
    }

    -- Debug

    use {
       "mfussenegger/nvim-dap",
      opt      = true,
      -- event = "BufReadPre",
      keys     = { [[<leader>d]] },
      module   = { "dap" },
      wants    = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "which-key.nvim" },
      requires = {
        -- "Pocco81/DAPInstall.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "nvim-telescope/telescope-dap.nvim",
        { "leoluz/nvim-dap-go", module = "dap-go" },
        { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      },
      config = function()
        require("luis.dap").setup()
      end,
      disable = true
    }

    -- Git

    use {
      "lewis6991/gitsigns.nvim",
      event    = "BufReadPre",
      wants    = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config   = function()
        require("luis.config.gitsigns").setup()
      end
    }

    use { "tpope/vim-fugitive", cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" }, requires = { "tpope/vim-rhubarb", "idanarye/vim-merginal" } }

    use { "rbong/vim-flog", cmd = { "Flog", "Flogsplit", "Floggit" }, wants = { "vim-fugitive" } }
    -- Performance

    use { "dstein64/vim-startuptime", cmd = "StartupTime" }
    use { "nathom/filetype.nvim" }
    use { "lewis6991/impatient.nvim" }

    -- Theme

    use {
      "svrana/neosolarized.nvim",
      requires = { "tjdevries/colorbuddy.nvim" }
    }

    if packer_boostrap then
      print("neovim restart is required after installation!")
      require("packer").sync()
    end

  end

  packer_init()

  local packer = require "packer"
  local utils = require "packer.util"
  pcall(require, "impatient")

  packer.startup({ plugins, config = {
    display = {
      open_fn = function()
        return utils.float({ border = 'single' })
      end
    }
  }})

end

return M
