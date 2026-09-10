return {
  "neovim/nvim-lspconfig",
  opts = {
    -- end-of-line virtual_text gets clipped at the window edge;
    -- virtual_lines wraps the full message onto its own line instead
    diagnostics = {
      virtual_text = false,
      virtual_lines = { current_line = true },
    },
  },
}
