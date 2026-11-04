-- yazi as a secondary file manager, alongside LazyVim's default snacks
-- explorer (which stays on <leader>e / <leader>E untouched).
--
-- keys mirror the explorer's <leader>fe / <leader>fE pair. The README's
-- suggested <leader>- and <c-up> clash with LazyVim's "Split Window Below"
-- and "Increase Window Height".
--
-- open_for_directories stays false (the default) so `nvim .` and :e <dir>
-- keep going to snacks; flip it (plus vim.g.loaded_netrwPlugin = 1 in init)
-- only if yazi should replace the explorer outright.
return {
  "mikavilpas/yazi.nvim",
  dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
  keys = {
    { "<leader>fy", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Yazi (current file)" },
    { "<leader>fY", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)" },
  },
  ---@type YaziConfig | {}
  opts = {
    -- LazyVim uses clipboard=unnamedplus; yazi.nvim defaults to "*"
    -- (primary selection), so <c-y> paths would miss the system clipboard
    clipboard_register = "+",
    keymaps = { show_help = "<f1>" },
  },
}
