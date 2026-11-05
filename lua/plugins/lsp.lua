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
    servers = {
      -- Apollo Language Server (rover >= 0.27 must be on PATH; not in Mason)
      apollo_ls = {
        filetypes = { "graphql" },
        root_markers = { "supergraph.yaml" },
        workspace_required = true, -- don't start without a supergraph.yaml
        -- nvim launches servers from its own cwd, so run rover from the
        -- project root for the relative supergraph.yaml path to resolve
        cmd = function(dispatchers, config)
          return vim.lsp.rpc.start(
            { "rover", "lsp", "--supergraph-config", "supergraph.yaml" },
            dispatchers,
            { cwd = config.root_dir }
          )
        end,
      },
    },
  },
}
