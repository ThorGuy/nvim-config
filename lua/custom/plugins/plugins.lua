vim.pack.add( {
  {
    src = 'https://github.com/pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('octo').setup() end,
  },

  {
    src = 'https://github.com/mfussenegger/nvim-dap',
  },

  {
    src = 'https://github.com/igorlfs/nvim-dap-view',
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {},
  },

  {
    src = 'https://github.com/zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-S-y>',
            accept_line = '<M-S-y>',
            accept_word = '<C-M-S-y>',
            next = '<C-S-.>',
            prev = '<C-S-,>',
            dismiss = '<C-S-space>',
          },
        },
        filetypes = {
          ['*'] = true,
          markdown = false,
          environment = false,
        },
      }
    end,
  },

  {
    src = 'https://github.com/echasnovski/mini.nvim',
    config = function()
      require('mini.animate').setup {
        cursor = {
          enable = false,
        },
        scroll = {
          timing = function(_, n) return 20 / n end,
        },
      }
    end,
  },

  {
    src = 'https://github.com/nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enable = true,
        },
        default_run_args = {
          flutter = '--dart-define=RICE_HOST=https://awake-arguably-chamois.ngrok-free.app',
        },
        widget_guides = {
          enabled = true,
        },
        outline = {
          open_cmd = '20vnew',
        },
        lsp = {
          color = {
            enabled = true,
            background = true,
          },
        },
      }
    end,
  },

  {
    src = 'https://github.com/alec-gibson/nvim-tetris',
  },

  {
    src = 'https://github.com/hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },

  {
    src = 'https://github.com/saghen/blink.compat',
  },

  {
    src = 'https://github.com/nickjvandyke/opencode.nvim',
    dependencies = {
      {
        -- `snacks.nvim` integration is recommended, but optional
        ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
        'folke/snacks.nvim',
        optional = true,
        opts = {
          input = {}, -- Enhances `ask()`
          picker = { -- Enhances `select()`
            actions = {
              opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
                },
              },
            },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
      }

      vim.o.autoread = true -- Required for `opts.events.reload`

      -- Recommended/example keymaps
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode…' })
      vim.keymap.set({ 'n', 'x' }, '<leader>os', function() require('opencode').select() end, { desc = 'Execute opencode action…' })
      vim.keymap.set({ 'n', 't' }, '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })

      vim.keymap.set({ 'n', 'x' }, '<leader>o', function() return require('opencode').operator '@this ' end, { desc = 'Add range to opencode', expr = true })
      vim.keymap.set('n', '<leader>oo', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add line to opencode', expr = true })

      vim.keymap.set('n', '<S-C-u>', function() require('opencode').command 'session.half.page.up' end, { desc = 'Scroll opencode up' })
      vim.keymap.set('n', '<S-C-d>', function() require('opencode').command 'session.half.page.down' end, { desc = 'Scroll opencode down' })
    end,
  },

  -- {
  --   'adam12/ruby-lsp.nvim',
  --   branch = 'neovim-11-native-lsp',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'neovim/nvim-lspconfig',
  --   },
  --   config = {
  --     lspconfig = {
  --       init_options = {
  --         formatter = 'standard',
  --         linters = { 'standard' },
  --       },
  --     },
  --   },
  -- },
})
