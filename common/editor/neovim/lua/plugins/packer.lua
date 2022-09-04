local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  use 'savq/melange'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'airblade/vim-gitgutter'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'romgrk/barbar.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'neovim/nvim-lspconfig'

  use {
    "akinsho/toggleterm.nvim", 
    tag = 'v2.*', 
  }

  use { 
    'neoclide/coc.nvim', 
    branch = 'release' 
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { 
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0' 
  }

  use {
    'goolord/alpha-nvim',
  }

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

