-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- adds relative line numbers
vim.opt.relativenumber = true

-- adds wrapping long lines
vim.opt.wrap = true

-- transparent background
lvim.transparent_window = true

-- center cursor when moving half page
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- disable indentation guides
lvim.builtin.indentlines.active = false

-- This part doesn't work the way I want, so fix later
-- Enable displaying invisible characters
-- vim.opt.list = true
-- Define the characters for displaying whitespace
-- vim.opt.listchars:append({ tab = '> ', trail = '-', nbsp = '+', eol = '·' })

lvim.builtin.which_key.setup.ignore_missing = true

vim.opt.list = true
vim.opt.listchars = {
  space = "·"
}
