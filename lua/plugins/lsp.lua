return {
  "neovim/nvim-lspconfig",
  opts = {
    -- LazyVim >= 15.0.0 uses LSP foldingRange folds by default; opt out to
    -- keep treesitter folds (zM did nothing in Python buffers otherwise)
    folds = { enabled = false },
    -- end-of-line virtual_text gets clipped at the window edge;
    -- virtual_lines wraps the full message onto its own line instead
    diagnostics = {
      virtual_text = false,
      virtual_lines = { current_line = true },
    },
  },
}
