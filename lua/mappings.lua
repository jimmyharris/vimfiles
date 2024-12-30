local keymap = vim.keymap
local uv = vim.uv

keymap.set("", "Q", "gq", desc = "Reformat motion")
keymap.set("", "<leader>A", ":A<CR><CR>", desc = "Switch to alternate file.")

-- Edit and reload nvim config quickly
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<CR>", {
  silent = true,
  desc = "open init.lua",
})

keymap.set("n", "<leader>sv", function()
  vim.cmd([[
    update $MYVIMRC
    source $MYVIMRC
    ]])
  vim.nnotify("Nvim config successfully reloaded!", nvim.log.levels.INFO, { title = "nvim-config" })
end,
  silent = true,
  desc = "reload init.lua"
)
