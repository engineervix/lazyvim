return {
  "coder/claudecode.nvim",
  -- Override the default LazyVim ai.claudecode extra options.
  -- The other keybindings come from the extra itself.
  event = "VeryLazy", -- start the IDE server without waiting for a keypress
  keys = {
    -- The extra doesn't bind this for the Snacks explorer.
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file", ft = "snacks_picker_list" },
  },
  opts = {
    -- vim.fn.expand is required: kitty gets this as a literal argv entry.
    terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
    terminal = {
      -- Run Claude in an external kitty pane instead of a Neovim
      -- floating/split terminal, so it behaves like a real IDE
      -- side panel (own scrollback, resizable, survives :qa).
      provider = "external",
      provider_opts = {
        -- Requires kitty.conf: `allow_remote_control socket-only` and
        -- `listen_on unix:/tmp/kitty` (full kitty restart to apply).
        external_terminal_cmd = function(cmd, env)
          local args = {
            "kitty",
            "@",
            "launch",
            "--location=vsplit",
            "--cwd=" .. LazyVim.root.git(),
            -- The launch job exits at once, so the plugin can't track the pane.
            -- Let kitty find this Neovim's pane by port; values are regexes, so anchor.
            "--focus-existing=env:CLAUDE_CODE_SSE_PORT=^" .. tostring(env.CLAUDE_CODE_SSE_PORT) .. "$",
          }
          -- The pane is spawned by the kitty server, not Neovim, so it would
          -- miss VIRTUAL_ENV, PATH tweaks, direnv vars etc. Forward nvim's env.
          -- Skip KITTY_* (kitty sets those per window).
          local full = vim.tbl_extend("force", vim.fn.environ(), env)
          for k, v in pairs(full) do
            if k:sub(1, 6) == "KITTY_" then
              goto continue
            end
            vim.list_extend(args, { "--env", k .. "=" .. v })
            ::continue::
          end
          return vim.list_extend(args, require("claudecode.utils").parse_command(cmd))
        end,
      },
    },
    diff_opts = { open_in_new_tab = true },
  },
}
