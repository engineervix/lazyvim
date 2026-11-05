-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- lang.python extra (enabled in lazyvim.json) reads this at require-time,
-- so it must be set here (pre-lazy.nvim), not in lua/plugins/*.lua (too late)
vim.g.lazyvim_python_lsp = "basedpyright"

-- Neovim starts its Node host (the process that runs Node plugins) with
-- `node <node_host_prog>`. The value must be the path to `cli.js`. This file
-- starts the host and is the entry point of the `neovim` npm package.
-- By default, Neovim finds `cli.js` with `npm root -g`. Vite+ (`vp`) installs
-- each global package in its own directory, so that command does not point to
-- the package. `vp env which` prints the path to `cli.js`.
-- Do not use the `neovim-node-host` shim (a small launcher program). It is a
-- `vp` binary, not a JavaScript file, so `node` cannot run it.
-- If `vp` is missing or fails, this block does nothing.
if vim.fn.executable("vp") == 1 then
  local out = vim.fn.systemlist({ "vp", "env", "which", "neovim-node-host" })
  if vim.v.shell_error == 0 and out[1] and out[1]:match("cli%.js$") then
    vim.g.node_host_prog = out[1]
  end
end
