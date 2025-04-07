local utils = require("utils")

local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"

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
  -- auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    name = "nvim-cmp",
    -- event = 'InsertEnter',
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("config.lsp")
    end,
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("config.glance")
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  },
  {
    -- NOTE: The upstream implementation is here:
    -- "RRethy/nvim-treesitter-endwise",
    -- This fork includes:
    --   https://github.com/RRethy/nvim-treesitter-endwise/pull/42
    -- which fixes
    --   https://github.com/RRethy/nvim-treesitter-endwise/issue/41
    "metiulekm/nvim-treesitter-endwise",
    event = "VeryLazy",
    config = function()
      require("config.treesitter-endwise")
    end,
  },
  { "machakann/vim-swap", event = "VeryLazy" },
  -- Super fast buffer jump
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("config.nvim_hop")
    end,
  },

  -- Show match number and index for searching
  {
    "kevinhwang91/nvim-hlslens",
    branch = "main",
    keys = { "*", "#", "n", "N" },
    config = function()
      require("config.hlslens")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function ()
      require("config.telescope")
    end
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup {}
    end,
  },
  { "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
    config = function()
      require("config.venv-selector")
    end
  },

  -- A list of colorscheme plugin you may want to try. Find what suits you.
  { "navarasu/onedark.nvim", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "v2",
  },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
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
  -- Python-related text object
  { "jeetsukumaran/vim-pythonsense", ft = { "python" } },
  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  { "wellle/targets.vim", event = "VeryLazy" },

  -- Add indent object for vim (useful for languages like Python)
  { "michaeljsmith/vim-indent-object", event = "VeryLazy" },
  { "tpope/vim-abolish", event = "VeryLazy" },
  { "tpope/vim-surround", event = "VeryLazy" },
  { "andymass/vim-matchup", event = "BufRead" },
  { "vim-scripts/SelectBuf", dependencies = {"vim-scripts/genutils"}, },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine")
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    cond = firenvim_not_active,
    config = function()
      require("config.bufferline")
    end
  },

  -- fancy start screen
  {
    "nvimdev/dashboard-nvim",
    cond = firenvim_not_active,
    config = function()
      require("config.dashboard-nvim")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    config = function()
      require("config.indent-blankline")
    end
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("config.nvim-osc52")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {},
    init = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      require("config.nvim_ufo")
    end,
  },
  -- Highlight URLs inside vim
  { "itchyny/vim-highlighturl", event = "VeryLazy" },

  -- notification plugin
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("config.nvim-notify")
    end,
  },
  -- Automatic insertion and deletion of a pair of characters
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment plugin
  { "tpope/vim-commentary", event = "VeryLazy" },

  -- Show undo history visually
  { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } },

  -- Handy unix command inside Vim (Rename, Move etc.)
  { "tpope/vim-eunuch", cmd = { "Rename", "Delete" } },

  -- Repeat vim motions
  { "tpope/vim-repeat", event = "VeryLazy" },

  { "nvim-zh/better-escape.vim", event = { "InsertEnter" } },

  -- Auto format tools
  { "sbdchd/neoformat", cmd = { "Neoformat" } },

  -- Git command inside vim
  {
    "tpope/vim-fugitive",
    config = function()
      require("config.fugitive")
    end,
  },

  -- Better git log display
  { "rbong/vim-flog", cmd = { "Flog" } },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "ruifm/gitlinker.nvim",
    event = "User InGitRepo",
    config = function()
      require("config.git-linker")
    end,
  },

  -- Show git change (change, delete, add) signs in vim sign column
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns")
    end,
  },

  {
    "sindrets/diffview.nvim",
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("config.bqf")
    end,
  },

  -- Another markdown plugin
  { "preservim/vim-markdown", ft = { "markdown" } },

  -- Faster footnote generation
  { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } },

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  { "godlygeek/tabular", cmd = { "Tabularize" } },

  { "chrisbra/unicode.vim", event = "VeryLazy" },

  -- Additional powerful text object for vim, this plugin should be studied
  -- carefully to use its full power
  { "wellle/targets.vim", event = "VeryLazy" },

  -- Add indent object for vim (useful for languages like Python)
  { "michaeljsmith/vim-indent-object", event = "VeryLazy" },
  -- Since tmux is only available on Linux and Mac, we only enable these plugins
  -- for Linux and Mac
  -- .tmux.conf syntax highlighting and setting check
  {
    "tmux-plugins/vim-tmux",
    enabled = function()
      if utils.executable("tmux") then
        return true
      end
      return false
    end,
    ft = { "tmux" },
  },

  -- Modern matchit implementation
  { "andymass/vim-matchup", event = "BufRead" },
  { "tpope/vim-scriptease", cmd = { "Scriptnames", "Messages", "Verbose" } },

  -- Asynchronous command execution
  { "skywind3000/asyncrun.vim", lazy = true, cmd = { "AsyncRun" } },
  { "cespare/vim-toml", ft = { "toml" }, branch = "main" },

  -- Session management plugin
  { "tpope/vim-obsession", cmd = "Obsession" },

  -- The missing auto-completion for cmdline!
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    -- show hint for code actions, the user can also implement code actions themselves,
    -- see discussion here: https://github.com/neovim/neovim/issues/14869
    "kosayoda/nvim-lightbulb",
    config = function()
      require("config.lightbulb")
    end,
  },
  { "Bekaboo/dropbar.nvim" },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },

  -- ansible ft and highlighting.
  { "pearofducks/ansible-vim" },
}

---@diagnostic disable-next-line: missing-fields
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
