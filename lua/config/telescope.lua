local telescope = require("telescope")
local keymap = vim.keymap

telescope.load_extension("live_grep_args")

local tele_builtin = require("telescope.builtin")

keymap.set('n', '<leader>ff', tele_builtin.find_files, { desc = 'Telescope find files' })

keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, { desc = 'Telescope live grep' })

keymap.set('n', '<leader>fh', tele_builtin.help_tags, { desc = 'Telescope help tags' })

keymap.set('n', '<leader>ft', tele_builtin.current_buffer_tags, { desc = 'Telescope buffer tags' })
keymap.set('n', '<leader>fb', tele_builtin.buffers, { desc = 'Telescope buffers' })

keymap.set('n', '<leader>fr', tele_builtin.oldfiles, { desc = 'Telescope buffers or files' })

