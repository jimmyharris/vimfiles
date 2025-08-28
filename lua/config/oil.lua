vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("oil").setup({
  columns = {
    "icon",
    "permission",
    "size",
    "mtime",
  },
  watch_for_changes = true,
  show_hidden = true,
})
