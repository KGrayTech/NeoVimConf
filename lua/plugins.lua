local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  profile = {
    enable = true,
    threshold = 0,
  },

  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "sainnhe/everforest" -- Everforest is a green based color scheme

  use { "nvim-lua/plenary.nvim", module = "plenary" } -- Useful lua functions used by lots of plugins

  -- A git plugin inspired by the Magit plugin for git in Emacs
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("configs.neogit").setup()
    end,
  }


  -- Startup dashboard
  use {
    "goolord/alpha-nvim",
    config = function()
      require("configs.alpha").setup()
    end
  }


  -- Plugin for show all keybindings
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("configs.whichkey").setup()
    end
  }

  -- Better icons
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end
  }

  -- Better comment
  use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup {}
    end
  }

  -- Plugin for hopping between words (like EasyMotion)
  use {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopChar1" },
    config = function()
      require("hop").setup {}
    end
  }

  use {
    "ggandor/lightspeed.nvim",
    keys = { "s", "S", "f", "F", "t", "T" },
    config = function()
      require("lightspeed").setup {}
    end
  }

  -- For markdown files
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = {"MarkdownPreivew"}
  }

  -- Status line plugin
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("configs.lualine").setup()
    end,
    requires = { "nvim-web-devicons" },
  }

  -- Treesitter plugin for good code highlight
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("configs.treesitter").setup()
    end,
  }

  -- Telescope plugin for fuzzy search
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- File explorer plugin
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("configs.nvimtree").setup()
    end,
  }

 
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

