-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- lang.python extra (enabled in lazyvim.json) reads this at require-time,
-- so it must be set here (pre-lazy.nvim), not in lua/plugins/*.lua (too late)
vim.g.lazyvim_python_lsp = "basedpyright"
