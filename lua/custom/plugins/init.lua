-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.animate').setup {
        cursor = {
          enable = false,
        },
        scroll = {
          timing = function(_, n)
            return 20 / n
          end,
        },
      }
    end,
  },
  {
    'alec-gibson/nvim-tetris',
  },
}
