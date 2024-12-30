--- Lua initialized configurtion
vim.loader.enable()

local utils = require("utils")

local expected_version = "0.10.3"
utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string
local load_old_config = true

if load_old_config then
  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/init.vim"))
else
  local globals = require("globals")

  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/options.vim"))

  vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/plugins.vim"))
end
