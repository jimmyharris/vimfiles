local utils = require("utils")

local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"
local config_dir = vim.fn.stdpath("config")

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- check if firenvim is active
  local firenvim_not_active = function()
    return not vim.g.started_by_firenvim
  end

  local plugin_specs = {
    -- color scheme
    {
      "tpope/vim-sensible",
      lazy = false,
      priority = 1000,
      name = "sensible",
      config = function()

        vim.cmd("source " .. vim.fs.joinpath(plugin_dir, "sensible/plugin/sensible.vim"))
      end
    },
    {
      "rakr/vim-one",
      lazy = false,
      priority = 999,
      name = "one",
      config = function()
        vim.cmd([[colorscheme one]])
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      event = "VeryLazy",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("config.nvim-tree")
      end,
    },
    {
      "vim-airline/vim-airline",
      lazy = false,
      dependencies = {
        "vim-airline/vim-airline-themes"
      },
      config = function()
        vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/config/airline.vim"))
      end,
    },
    {
      "editorconfig/editorconfig-vim",
      lazy = false,
    },
    {"tpope/vim-abolish"},
    {"tpope/vim-endwise"},
    {"tpope/vim-fugitive"},
    {"tpope/vim-obsession"},
    {"tpope/vim-repeat"},
      {"tpope/vim-surround"},
      {"tpope/vim-unimpaired"},
      {"tmhedberg/matchit"},
      {"vim-scripts/SelectBuf", dependencies = {"vim-scripts/genutils"},},
      {"tpope/vim-commentary", event = "VeryLazy"},
      {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
          require("config.nvim-notify")
        end,
      },
      {
        "nvimdev/dashboard-nvim",
        cond = firevim_not_active,
        config = function()
          require("config.dashboard-nvim")
        end

      }
    }

    require("lazy").setup {
      spec = plugin_specs,
      ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
      },
      rocks = {
        enabled = false,
        hererocks = false,
      },
    }
