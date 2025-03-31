local fn = vim.fn
local api = vim.api

local utils = require("utils")

------------------------------------------------------------------------
--                          global options                            --
------------------------------------------------------------------------

--- Set default tab width unless otherwise specified in ft plugin.
local TAB_WIDTH = 2
vim.o.tabstop = TAB_WIDTH
vim.o.shiftwidth = TAB_WIDTH
vim.o.softtabstop = TAB_WIDTH
vim.o.expandtab = true

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_windows = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac = utils.has("macunix") and true or false

vim.g.logging_level = vim.log.levels.INFO

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

-- TODO: Need to determine common python support strategy
local python_venv_dir = fn.stdpath("data") .. "/nvim-venv"
local python_path = nil

if vim.g.is_windows then
  python_path = python_venv_dir .. "/Scripts/python.exe"
else
  python_path = python_venv_dir .. "/bin/python"
end


if not vim.uv.fs_stat(python_venv_dir) then
  if utils.executable("uv") then
    fn.system {
      "uv",
      "venv",
      "--python",
      "3.13",
      python_venv_dir
    }
    fn.system {
      "uv",
      "pip",
      "install",
      "--python",
      python_path,
      "pynvim",
    }
    if vim.g.is_windows then
      vim.g.python3_host_prog = fn.substitute(python_path, ".exe$", "", "g")
    else
      vim.g.python3_host_prog = python_path
    end
  else
    api.nvim_err_writeln("uv executable not found! You must install uv and set its PATH correctly!")
  end
else
  if vim.g.is_windows then
    vim.g.python3_host_prog = fn.substitute(python_path, ".exe$", "", "g")
  else
    vim.g.python3_host_prog = python_path
  end
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ","

-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = "l"

-- Use English as main language
vim.cmd([[language en_US.UTF-8]])

-- Disable loading certain plugins

-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3
if vim.g.is_windows then
  vim.g.netrw_http_cmd = "curl --ssl-no-revoke -Lo"
end

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1

-- Point to the initial runtime path for lua
vim.g.user_rtp = vim.opt.rtp:get()[1]

-- control how to show health check window
vim.g.health = { style = nil }
