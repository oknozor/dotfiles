local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- Style
  use 'savq/melange'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'romgrk/barbar.nvim'

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
      'glepnir/lspsaga.nvim',
    },
  }

  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })

  use 'simrat39/rust-tools.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use('jose-elias-alvarez/null-ls.nvim')

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter')
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use "IndianBoy42/tree-sitter-just"

  --Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  }
  use('onsails/lspkind.nvim')
  use('hrsh7th/cmp-path')
  use ('hrsh7th/cmp-buffer')

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
  })

  -- Greeter
  use {
    'goolord/alpha-nvim',
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
  }

  -- Git
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup { }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
