-- MR/PR-style review: merge-base of <base> and HEAD vs the working tree.
-- Plain git, so it works on any forge (GitLab, GitHub, Gitea, Bitbucket...).
-- Edit the base in the prompt for branches that don't target the default,
-- e.g. origin/develop. default_args adds --imply-local.
local function review_mr()
  vim.ui.input({ prompt = "Review base: ", default = "origin/HEAD" }, function(input)
    if input and input ~= "" then
      vim.cmd("DiffviewOpen " .. input .. "...HEAD")
    end
  end)
end

return {
  {
    "dlyongemallo/diffview-plus.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewToggle",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewDiffFiles",
      "DiffviewLog",
    },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview (working tree)" },
      { "<leader>gV", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
      -- ":" not <cmd>, so the '<,'> range reaches the command.
      { "<leader>gV", ":'<,'>DiffviewFileHistory --follow<cr>", mode = "x", desc = "Diffview line history" },
      { "<leader>gR", review_mr, desc = "Diffview review (MR/PR)" },
    },
    opts = {
      enhanced_diff_hl = true,
      -- Right side = working-tree file (editable, LSP works) for rev ranges.
      default_args = { DiffviewOpen = { "--imply-local" } },
      hooks = {
        -- treesitter-context breaks scrollbind alignment in diff panes: re-run its
        -- on_attach (see the nvim-treesitter-context spec below) and re-enable on close.
        diff_buf_win_enter = function(bufnr)
          pcall(vim.api.nvim_exec_autocmds, "BufReadPost", {
            buffer = bufnr,
            group = "treesitter_context_update",
            modeline = false, -- diff buffers are non-modifiable; avoids E21
          })
        end,
        view_closed = function()
          local ok, tsc = pcall(require, "treesitter-context")
          if ok and tsc.enabled() then
            tsc.enable()
          end
        end,
      },
    },
  },

  -- Diffview sets vim.b.ts_context_disable on its buffers; this makes it take effect.
  -- Merges over the LazyVim ui.treesitter-context extra's opts.
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      on_attach = function(buf)
        return not vim.b[buf].ts_context_disable
      end,
    },
  },

  -- Diffview buffers list z* fold maps described "diffview_ignore"; hide them.
  {
    "folke/which-key.nvim",
    opts = {
      filter = function(mapping)
        return mapping.desc ~= "diffview_ignore"
      end,
    },
  },
}
