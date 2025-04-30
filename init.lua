--- Lua initialized configurtion
vim.loader.enable()

local utils = require("utils")

local expected_version = "0.11.1"
utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string
local load_old_config = false

if load_old_config then
  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/init.vim"))
else
  require("globals")

  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/options.vim"))

  require("mappings")

  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/plugins.vim"))

  -- diagnostic related config
  require("diagnostic-conf")

  require("colorschemes")
end
